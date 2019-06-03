# Sieve jQuery Plugin

Sieve allows you to quickly add an interactive search filter to any block of content.

[**View the Demo**](http://rmm5t.github.io/jquery-sieve/)

---

**How You Can Help**

[![Square Cash](http://img.shields.io/badge/square%20cash-$rmm5t-brightgreen.svg)][square]
[![Gratipay](http://img.shields.io/gratipay/rmm5t.svg)][gratipay]
[![Book a Codementor session](http://img.shields.io/badge/codementor-book%20a%20session-orange.svg)][codementor]

If you like this project, [buy me a coffee][square], [donate via Gratipay][gratipay], or [book a session with me on Codementor][codementor].

Bitcoin: `1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m`

[square]: https://cash.me/$rmm5t "Donate to rmm5t for open source!"
[gratipay]: https://gratipay.com/rmm5t/ "Donate to rmm5t for open source!"
[bitcoin]: bitcoin:1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m?amount=0.01&label=Coffee%20to%20rmm5t%20for%20Open%20Source "Buy rmm5t a coffee for open source!"
[codementor]: https://www.codementor.io/rmm5t?utm_campaign=profile&utm_source=button-rmm5t&utm_medium=shields "Book a session with rmm5t on Codementor!"

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

## License

[MIT License](https://rmm5t.mit-license.org/)
