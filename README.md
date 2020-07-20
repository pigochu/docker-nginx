# docker-nginx

這是我個人自己用的 , 不相容官方 nginx 的使用方式

主要是要用到 nginx 中的 http_cache_purge 這個模組

由於目前還處於個人使用中，所以用法都可能有變化

## 環境變數說明 ##

### NGINX_UID=101 ###

預設 Nginx 的 UID 是 101 , 但某些狀況下我們想要讓他與其他 container 一致，例如使用到 fastcgi cache purge , 想要完全刪除快取，可能要用同樣權限，這時候可以將 UID 換掉，container 在第一次啟動時會修改 nginx 的 UID , 並將相關快取路徑也改為 NGINX_UID 指定值


## 使用說明 ##

參考 test-sample 目錄 , 其中示範了如何使用 fastcgi cache ，及設定兩個 container UID 一致，例如 wordpress nginx helper plugin 可能會需要刪除全部快取時，遇到權限問題，就是兩個 container uid 不一致造成的

### 測試是否有快取 ###

1. 打開 http://localhost:8888
2. 觀看 Header 的 X-Cache , 第一次應該是 MISS , 第二次瀏覽應該是 HIT

### 測試清除叧取 ###

1. 打開 http://localhost:8888/purge/
2. 若成功清除，應該會看到頁面 Successful purge



## Build 方式 ##

docker build -t pigochu/nginx:alpine-3.12 -f alpine-3.12/Dockerfile .