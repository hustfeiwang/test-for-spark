# Spark测试工具

# 覆盖范围
Spark Core, Sql, MLlib, graphx, Streaming
- core, mllib, graphx 的测试使用spark examples
- sql 使用tpc-ds基准测试
- streaming使用kafka作为数据源

# 说明
在results目录中显示成功和失败的例子

# 用法
## 1、配置conf
在conf.sh中配置相关选项
## 2、上传测试数据
./upload-data/sh
## 3、 测试 spark core
./run-example-core.sh
## 4、 测试spark mllib
./run-example-mllib.sh
## 5、测试完数据之后清空测试数据
./clear-data-afterall.sh



