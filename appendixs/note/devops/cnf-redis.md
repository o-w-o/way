# PostgreSQL 使用和配置

## 创建数据库

```sql
create database if not exists d_symbols default charset utf8 collate utf8_general_ci;
create database if not exists d_symbols_dev default charset utf8 collate utf8_general_ci;
```

## 创建用户

```postgresql
create user symbols with password 'symbols';
create user symbols_dev with password 'symbols_dev';
create user symbols_analysis with password 'symbols_analysis';
```

### 分配权限

```postgresql
grant all privileges on d_symbols.* to symbols;
grant all privileges on d_symbols_dev.* to symbols_dev;


grant select on d_symbols.* to symbols_analysis;
grant select on d_symbols_dev.* to symbols_analysis;
```

## 安全配置

### 访问限制

[postgres 配置只能让某一个 ip 的主机登陆](https://stackoverflow.com/questions/11753296/configure-postgresql-to-work-for-only-localhost-or-specified-ip-port)

> I want to configure PostgreSQL to accept connections only from a specified IP. It should not accept requests from any other IP.
>
> ---------------------------------------------
>
> The following pg_hba.conf allows local and specified Ip have privilege login， but reject others。
>
> ```
> # TYPE  DATABASE        USER            ADDRESS                 METHOD
> local   all             all                                     trust
> host    testdb          testuser      192.168.1.1/32             md5
> host    all             all           0.0.0.0/0                 reject 
> ```