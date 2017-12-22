package io.github.izzyleung.zhihudailypurify.ui.activity;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.RelativeLayout;

import java.util.ArrayList;
import java.util.List;

import io.github.izzyleung.MySearchView;
import io.github.izzyleung.zhihudailypurify.R;
import io.github.izzyleung.zhihudailypurify.bean.DailyNews;
import io.github.izzyleung.zhihudailypurify.observable.NewsListFromSearchObservable;
import io.github.izzyleung.zhihudailypurify.ui.fragment.SearchNewsFragment;
import rx.Observer;
import rx.Subscription;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

public class SearchActivity extends BaseActivity implements Observer<List<DailyNews>> {
    private MySearchView searchView;
    private SearchNewsFragment searchNewsFragment;
    private ProgressDialog dialog;

    private Subscription searchSubscription;
    private List<DailyNews> newsList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        initView();
        initDialog();

        searchNewsFragment = new SearchNewsFragment();
        getSupportFragmentManager()
                .beginTransaction()
                .add(R.id.fragment_frame, searchNewsFragment)
                .commit();
    }

    @Override
    public void onDestroy() {
        searchNewsFragment = null;

        super.onDestroy();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private void initView() {
        searchView = new MySearchView(this);
        searchView.setQueryHint(getResources().getString(R.string.search_hint));
        searchView.setOnQueryTextListener(query -> {
            dialog.show();
            searchView.clearFocus();
            searchSubscription = NewsListFromSearchObservable.withKeyword(query)
                    .observeOn(AndroidSchedulers.mainThread())
                    .subscribeOn(Schedulers.io())
                    .doOnSubscribe(this::onSubscribe)
                    .doOnUnsubscribe(this::onUnsubscribe)
                    .subscribe(this);
            return true;
        });

        RelativeLayout relative = new RelativeLayout(this);
        relative.addView(searchView);

        mToolBar.addView(relative);

        setSupportActionBar(mToolBar);
        //noinspection ConstantConditions
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    private void initDialog() {
        dialog = new ProgressDialog(SearchActivity.this);
        dialog.setMessage(getString(R.string.searching));
        dialog.setCancelable(true);
        dialog.setOnCancelListener(dialog -> {
            if (searchSubscription != null && !searchSubscription.isUnsubscribed()) {
                searchSubscription.unsubscribe();
            }
        });
    }

    private void onSubscribe() {
        dialog.show();
    }

    private void onUnsubscribe() {
        dialog.dismiss();
    }

    @Override
    public void onNext(List<DailyNews> newsList) {
        this.newsList = newsList;
    }

    @Override
    public void onError(Throwable e) {
        dialog.dismiss();
        showSnackbar(R.string.no_result_found);
    }

    @Override
    public void onCompleted() {
        dialog.dismiss();
        searchNewsFragment.updateContent(newsList);
    }
}
