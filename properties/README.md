# 概览

分为 `服务端` 和 `客户端` 两部分。

## 约定

### 接口规范

基于 JWT 授权和认证的 REST 接口，服务端提供 OpenAPI 3.0 接口文档以及由 OpenAPITools 生成的基于 Rxjs 的 SDK —— `@o-w-o/api` 供前端使用。

### 数据格式

数据格式分为三类：

- 单数据
  ```java
  class ApiResult<T> {
    private Boolean success;
    private T payload;
    private Integer code;
    private String message;
    private Date timestamp;
  }
  ```
- 多数据
  ```java
  class ApiPagedResult<T> extends ApiResult<Paged<T>> {}
  ```
- 异常数据
  ```java
  class ApiException {}
  ```

### 存储约定

数据存储由后端数据库存储（PostgreSQL）；多媒体资源，如图片、视频、文件等由第三方云存储提供（阿里云 OSS）。

## 流程

- 服务端开发完成后部署服务器。
- 客户端开发完成后上传云存储，触发服务端刷新客户端入口页缓存。

## 安全

详见：[附录 - 安全清单](../appendixs/tool/security-checklist.md)

参考：Github [ security-guide-for-developers ](https://github.com/FallibleInc/security-guide-for-developers)
