load("@bazel_tools//tools/build_defs/repo:maven_rules.bzl", "maven_aar", "maven_jar")

def generate_maven_dependencies():
    maven_aar(
        name = "support_v4",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-v4:27.0.2",
        deps = [
            "@support_compat//aar",
            "@support_media_compat//aar",
            "@support_core_utils//aar",
            "@support_core_ui//aar",
            "@support_fragment//aar",
        ],
    )

    maven_aar(
        name = "support_appcompat_v7",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:appcompat-v7:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_core_utils//aar",
            "@support_fragment//aar",
            "@support_vector_drawable//aar",
            "@support_animated_vector_drawable//aar",
        ],
    )

    maven_aar(
        name = "support_cardview_v7",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:cardview-v7:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
        ],
    )

    maven_aar(
        name = "support_recyclerview_v7",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:recyclerview-v7:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
            "@support_core_ui//aar",
        ],
    )

    maven_aar(
        name = "support_design",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:design:27.0.2",
        deps = [
            "@support_v4//aar",
            "@support_appcompat_v7//aar",
            "@support_recyclerview_v7//aar",
            "@support_transition//aar",
        ],
    )

    maven_aar(
        name = "support_compat",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-compat:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@arch_lifecycle_runtime//aar",
        ],
    )

    maven_aar(
        name = "support_media_compat",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-media-compat:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
        ],
    )

    maven_aar(
        name = "support_core_utils",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-core-utils:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
        ],
    )

    maven_aar(
        name = "support_core_ui",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-core-ui:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
        ],
    )

    maven_aar(
        name = "support_fragment",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-fragment:27.0.2",
        deps = [
            "@support_compat//aar",
            "@support_core_ui//aar",
            "@support_core_utils//aar",
            "@support_annotations_27_0_2//jar",
        ],
    )

    maven_jar(
        name = "support_annotations_27_0_2",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-annotations:27.0.2",
    )

    maven_aar(
        name = "support_vector_drawable",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-vector-drawable:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
        ],
    )

    maven_aar(
        name = "support_animated_vector_drawable",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:animated-vector-drawable:27.0.2",
        deps = [
            "@support_vector_drawable//aar",
            "@support_core_ui//aar",
        ],
    )

    maven_aar(
        name = "support_transition",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:transition:27.0.2",
        deps = [
            "@support_annotations_27_0_2//jar",
            "@support_compat//aar",
        ],
    )

    maven_aar(
        name = "arch_lifecycle_runtime",
        settings = "//third_party:google_maven.xml",
        artifact = "android.arch.lifecycle:runtime:1.0.3",
        deps = [
            "@arch_lifecycle//jar",
            "@arch_core//jar",
            "@support_annotations_26_1_0//jar",
        ],
    )

    maven_jar(
        name = "arch_lifecycle",
        settings = "//third_party:google_maven.xml",
        artifact = "android.arch.lifecycle:common:1.0.3",
        deps = [
            "@support_annotations_26_1_0//jar",
        ],
    )

    maven_jar(
        name = "arch_core",
        settings = "//third_party:google_maven.xml",
        artifact = "android.arch.core:common:1.0.0",
        deps = [
            "@support_annotations_26_1_0//jar",
        ],
    )

    maven_jar(
        name = "support_annotations_26_1_0",
        settings = "//third_party:google_maven.xml",
        artifact = "com.android.support:support-annotations:26.1.0",
    )

    maven_jar(
        name = "gson",
        artifact = "com.google.code.gson:gson:2.8.0",
    )

    maven_jar(
        name = "jsoup",
        artifact = "org.jsoup:jsoup:1.7.3",
    )

    maven_jar(
        name = "rxjava",
        artifact = "io.reactivex:rxjava:1.1.3",
    )

    maven_aar(
        name = "universal_image_loader",
        artifact = "com.nostra13.universalimageloader:universal-image-loader:1.9.5",
    )

    maven_aar(
        name = "android_times_square",
        artifact = "com.squareup:android-times-square:1.6.4",
    )

    maven_aar(
        name = "recyclerview_stickyheaders",
        artifact = "com.eowise:recyclerview-stickyheaders:0.5.2",
    )

    maven_aar(
        name = "rxandroid",
        artifact = "io.reactivex:rxandroid:1.1.0",
        deps = [
            "@rxjava//jar",
        ]
    )

    maven_jar(
        name = "reactive_stream",
        artifact = "org.reactivestreams:reactive-streams:1.0.2",
    )

    maven_jar(
        name = "rxjava2",
        artifact = "io.reactivex.rxjava2:rxjava:2.1.7",
        deps = [
            "@reactive_stream//jar"
        ],
    )

def setup_android_app_dependencies():
    native.android_library(
        name = "android_app_dependencies",
        visibility = ["//visibility:public"],
        exports = [
            "@arch_core//jar",
            "@arch_lifecycle//jar",
            "@arch_lifecycle_runtime//aar",
            "@support_animated_vector_drawable//aar",
            "@support_annotations_27_0_2//jar",
            "@support_appcompat_v7//aar",
            "@support_cardview_v7//aar",
            "@support_compat//aar",
            "@support_core_ui//aar",
            "@support_core_utils//aar",
            "@support_design//aar",
            "@support_fragment//aar",
            "@support_media_compat//aar",
            "@support_recyclerview_v7//aar",
            "@support_transition//aar",
            "@support_v4//aar",
            "@support_vector_drawable//aar",            
            "@gson//jar",
            "@jsoup//jar",
            "@rxjava//jar",
            "@universal_image_loader//aar",
            "@android_times_square//aar",
            "@recyclerview_stickyheaders//aar",
            "@rxandroid//aar",
        ]
    )

def set_up_news_fetch_dependencies():
    native.java_library(
        name = "news_fetch_dependencies",
        visibility = ["//visibility:public"],
        exports = [
            "@jsoup//jar",
            "@reactive_stream//jar",
            "@rxjava2//jar",
        ]
    )

def setup_protobuf():
    native.http_archive(
        name = "com_google_protobuf",
        sha256 = "cef7f1b5a7c5fba672bec2a319246e8feba471f04dcebfe362d55930ee7c1c30",
        strip_prefix = "protobuf-3.5.0",
        urls = ["https://github.com/google/protobuf/archive/v3.5.0.zip"],
    )

    native.http_archive(
        name = "com_google_protobuf_javalite",
        strip_prefix = "protobuf-javalite",
        urls = ["https://github.com/google/protobuf/archive/javalite.zip"],
    )
