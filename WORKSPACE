workspace(name = "ZhihuDailyPurify")

android_sdk_repository(
    name = "androidsdk",
    api_level = 27,
    build_tools_version = "27.0.2"
)

load("//third_party:gen_deps.bzl", 
        "generate_maven_dependencies", 
        "setup_protobuf",
)

generate_maven_dependencies()
setup_protobuf()
