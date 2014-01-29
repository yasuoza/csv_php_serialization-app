# Online csv => php serialized object application

php's `json_decode` was so slow in some env, I used php serialized json file as a static web server's database.

## Demo

![capture](https://raw.github.com/yasuoza/csv_php_serialization-app/master/app/assets/images/screen_capture.gif)

## Why csv to php serialized object

Do you like this?

```php
while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
  $num = count($data);
  echo "<p> $num fields in line $row: <br /></p>\n";
  $row++;
  for ($c=0; $c < $num; $c++) {
    echo $data[$c] . "<br />\n";
  }
}
fclose($handle);
```

I don't like `while-for` syntax, but it is php and should use it if you choose csv to use database.


## Start

```
$ bundle install
$ bundle exec padrino s
```

## LICENSE

MIT.
