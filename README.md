# Sieve jQuery Plugin

Sieve allows you to quickly add an interactive search filter to any block of content.

[**View the Demo**](http://rmm5t.github.io/jquery-sieve/)

## How You Can Help

**If you like this project, please help. [Donate via Gittip][gittip] or [buy me a coffee with Bitcoin][bitcoin].**<br>
[![Gittip](http://img.shields.io/gittip/rmm5t.svg)][gittip]
[![Bitcoin](http://img.shields.io/badge/bitcoin-buy%20me%20a%20coffee-brightgreen.svg)][bitcoin]

**[Bitcoin][bitcoin]**: `1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m`<br>
[![Bitcoin Donation][bitcoin-qr-small]][bitcoin-qr-big]

## Need Help?

**You can [book a session with me on Codementor][codementor].**<br>
[![Book a Codementor session](http://img.shields.io/badge/codementor-book%20a%20session-orange.svg)][codementor]

[gittip]: https://www.gittip.com/rmm5t/ "Donate to rmm5t for open source!"
[bitcoin]: https://blockchain.info/address/1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m "Buy rmm5t a coffee for open source!"
[bitcoin-scheme]: bitcoin:1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m?amount=0.01&label=Coffee%20to%20rmm5t%20for%20Open%20Source "Buy rmm5t a coffee for open source!"
[bitcoin-qr-small]: http://chart.apis.google.com/chart?cht=qr&chs=150x150&chl=bitcoin%3A1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m%3Famount%3D0.01%26label%3DCoffee%2520to%2520rmm5t%2520for%2520Open%2520Source
[bitcoin-qr-big]: http://chart.apis.google.com/chart?cht=qr&chs=500x500&chl=bitcoin%3A1rmm5tv6f997JK5bLcGbRCZyVjZUPkQ2m%3Famount%3D0.01%26label%3DCoffee%2520to%2520rmm5t%2520for%2520Open%2520Source
[codementor]: https://www.codementor.io/rmm5t "Book a session with rmm5t on Codementor!"

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
