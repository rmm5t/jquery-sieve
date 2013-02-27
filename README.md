# Sieve jQuery Plugin

Sieve allows you to quickly add an interactive search filter to any block of content.

[**View the Demo**](http://rmm5t.github.com/jquery-sieve/)

## Usage

In the simplest case, you can add a search filter to any table. By default,
this example will filter all rows in the `<tbody>` section of a `<table
class="sieve">`.

```javascript
$(document).ready(function() {
  $("table.sieve").sieve();
});
```

To filter a list of paragraphs, override the `itemSelector` option. This
example will filter all `<p>` elements within the `<section class="sieve">`
container.

```javascript
$(document).ready(function() {
  $("section.sieve").sieve({ itemSelector: "p" });
});
```

In either case, Sieve will insert a search box before the content container and act as an interactive search filter for the content.

## Contributing

See the [**contributing guidelines**](CONTRIBUTING.md).

## Author

[Ryan McGeary](http://ryan.mcgeary.org) ([@rmm5t](http://twitter.com/rmm5t))

## Other

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2013, Ryan McGeary (ryan -[at]- mcgeary [*dot*] org)
