# Spark测试工具

# 覆盖范围
Spark Core, MLlib, graphx, Streaming
- core, mllib, graphx 的测试使用spark examples
- streaming使用kafka作为数据源
- sql请使用[TPCDS-FOR-SPARK](https://github.com/yaooqinn/tpcds-for-spark)

# 说明
在results目录中显示成功和失败的例子

# 用法
## 1、配置conf
在conf.sh中配置相关选项
## 2、上传测试数据
./upload-data/sh
## 3、 编译streaming程序运行所需要jar包
mvn clean compile package
## 4、 测试 spark core
./run-example-core.sh
## 5、 测试spark mllib
./run-example-mllib.sh
## 6、 测试spark graphx
./run-example-graphx.sh
## 7、 测试spark streaming
./run-example-streaming.sh
## 8、测试完数据之后清空测试数据
./clear-data-afterall.sh



