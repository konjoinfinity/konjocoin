Konjocoin Core
=============

Setup
---------------------
Konjocoin Core is the original Konjocoin client and it builds the backbone of the network. It downloads and, by default, stores the entire history of Konjocoin transactions, which requires approximately 22 gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Konjocoin Core, visit [konjocoin.org](https://konjocoin.org/).

Running
---------------------
The following are some helpful notes on how to run Konjocoin Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/konjocoin-qt` (GUI) or
- `bin/konjocoind` (headless)

### Windows

Unpack the files into a directory, and then run konjocoin-qt.exe.

### macOS

Drag Konjocoin Core to your applications folder, and then run Konjocoin Core.

### Need Help?

* See the documentation at the [Konjocoin Wiki](https://konjocoin.info/)
for help and more information.
* Ask for help on [#konjocoin](http://webchat.freenode.net?channels=konjocoin) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=konjocoin).
* Ask for help on the [KonjocoinTalk](https://konjocointalk.io/) forums, in the [Technical Support section](https://konjocointalk.io/c/technical-support).

Building
---------------------
The following are developer notes on how to build Konjocoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide (External Link)](https://github.com/konjocoin-core/docs/blob/master/gitian-building.md)

Development
---------------------
The Konjocoin repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [KonjocoinTalk](https://konjocointalk.io/) forums.
* Discuss general Konjocoin development on #konjocoin-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=konjocoin-dev.

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [konjocoin.conf Configuration File](konjocoin-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)
- [PSBT support](psbt.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
