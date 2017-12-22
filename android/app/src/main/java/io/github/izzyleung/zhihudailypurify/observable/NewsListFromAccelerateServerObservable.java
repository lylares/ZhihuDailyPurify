package io.github.izzyleung.zhihudailypurify.observable;

import java.util.List;

import io.github.izzyleung.zhihudailypurify.bean.DailyNews;
import io.github.izzyleung.zhihudailypurify.support.Constants;
import rx.Observable;

import static io.github.izzyleung.zhihudailypurify.observable.Helper.getHtml;
import static io.github.izzyleung.zhihudailypurify.observable.Helper.toNewsListObservable;

public class NewsListFromAccelerateServerObservable {
    public static Observable<List<DailyNews>> ofDate(String date) {
        return toNewsListObservable(getHtml(Constants.Urls.ZHIHU_DAILY_PURIFY_BEFORE, date));
    }
}
