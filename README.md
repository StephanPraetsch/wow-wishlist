# WoW addon for a wish list (BIS items)

## how to install

only manual installation, nowhere published yet

copy this folder `wow-wishlist` into your local wow folder `World of Warcraft\_retail_\Interface\AddOns\wow-wishlist`, e.g. `D:\Blizzard\World of Warcraft\_retail_\Interface\AddOns/wow-wishlist`

```shell
xcopy /Y . 'D:\Blizzard\World of Warcraft\_retail_\Interface\AddOns/wow-wishlist'
```

## how to see errors

```
/console scriptErrors 1
/reload
```

## how to deal with database

```
/dump <database name>
/dump Database
```

clear database: remove specific file in `D:\Blizzard\World of Warcraft\_retail_\WTF\Account\123456789\SavedVariables`

## which version is the current?

```
/dump GetBuildInfo()
```
