# Lab 1

Simple client for echo server provided on course website.

## Example

```bash
$ ./bolt.rb -h localhost -p 8000 --path /echo.php --parameters message=foo,bar=baz
```

Will send `GET /echo.php?message=foo&bar=baz HTTP/1.0\r\n\r\n` to localhost:8000.

