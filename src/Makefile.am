# Copyright (c) 2013-2016 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

DIST_SUBDIRS = secp256k1 univalue

AM_LDFLAGS = $(PTHREAD_CFLAGS) $(LIBTOOL_LDFLAGS) $(HARDENED_LDFLAGS) $(GPROF_LDFLAGS) $(SANITIZER_LDFLAGS)
AM_CXXFLAGS = $(DEBUG_CXXFLAGS) $(HARDENED_CXXFLAGS) $(WARN_CXXFLAGS) $(NOWARN_CXXFLAGS) $(ERROR_CXXFLAGS) $(GPROF_CXXFLAGS) $(SANITIZER_CXXFLAGS)
AM_CPPFLAGS = $(DEBUG_CPPFLAGS) $(HARDENED_CPPFLAGS)
AM_LIBTOOLFLAGS = --preserve-dup-deps
EXTRA_LIBRARIES =

if EMBEDDED_UNIVALUE
LIBUNIVALUE = univalue/libunivalue.la

$(LIBUNIVALUE): $(wildcard univalue/lib/*) $(wildcard univalue/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)
else
LIBUNIVALUE = $(UNIVALUE_LIBS)
endif

KONJOCOIN_INCLUDES=-I$(builddir) $(BDB_CPPFLAGS) $(BOOST_CPPFLAGS) $(LEVELDB_CPPFLAGS) $(CRYPTO_CFLAGS) $(SSL_CFLAGS)

KONJOCOIN_INCLUDES += -I$(srcdir)/secp256k1/include
KONJOCOIN_INCLUDES += $(UNIVALUE_CFLAGS)

LIBKONJOCOIN_SERVER=libkonjocoin_server.a
LIBKONJOCOIN_COMMON=libkonjocoin_common.a
LIBKONJOCOIN_CONSENSUS=libkonjocoin_consensus.a
LIBKONJOCOIN_CLI=libkonjocoin_cli.a
LIBKONJOCOIN_UTIL=libkonjocoin_util.a
LIBKONJOCOIN_CRYPTO_BASE=crypto/libkonjocoin_crypto_base.a
LIBKONJOCOINQT=qt/libkonjocoinqt.a
LIBSECP256K1=secp256k1/libsecp256k1.la

if ENABLE_ZMQ
LIBKONJOCOIN_ZMQ=libkonjocoin_zmq.a
endif
if BUILD_KONJOCOIN_LIBS
LIBKONJOCOINCONSENSUS=libkonjocoinconsensus.la
endif
if ENABLE_WALLET
LIBKONJOCOIN_WALLET=libkonjocoin_wallet.a
LIBKONJOCOIN_WALLET_TOOL=libkonjocoin_wallet_tool.a
endif

LIBKONJOCOIN_CRYPTO= $(LIBKONJOCOIN_CRYPTO_BASE)
if ENABLE_SSE41
LIBKONJOCOIN_CRYPTO_SSE41 = crypto/libkonjocoin_crypto_sse41.a
LIBKONJOCOIN_CRYPTO += $(LIBKONJOCOIN_CRYPTO_SSE41)
endif
if ENABLE_AVX2
LIBKONJOCOIN_CRYPTO_AVX2 = crypto/libkonjocoin_crypto_avx2.a
LIBKONJOCOIN_CRYPTO += $(LIBKONJOCOIN_CRYPTO_AVX2)
endif
if ENABLE_SHANI
LIBKONJOCOIN_CRYPTO_SHANI = crypto/libkonjocoin_crypto_shani.a
LIBKONJOCOIN_CRYPTO += $(LIBKONJOCOIN_CRYPTO_SHANI)
endif

$(LIBSECP256K1): $(wildcard secp256k1/src/*.h) $(wildcard secp256k1/src/*.c) $(wildcard secp256k1/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)

# Make is not made aware of per-object dependencies to avoid limiting building parallelization
# But to build the less dependent modules first, we manually select their order here:
EXTRA_LIBRARIES += \
  $(LIBKONJOCOIN_CRYPTO) \
  $(LIBKONJOCOIN_UTIL) \
  $(LIBKONJOCOIN_COMMON) \
  $(LIBKONJOCOIN_CONSENSUS) \
  $(LIBKONJOCOIN_SERVER) \
  $(LIBKONJOCOIN_CLI) \
  $(LIBKONJOCOIN_WALLET) \
  $(LIBKONJOCOIN_WALLET_TOOL) \
  $(LIBKONJOCOIN_ZMQ)

lib_LTLIBRARIES = $(LIBKONJOCOINCONSENSUS)

bin_PROGRAMS =
noinst_PROGRAMS =
TESTS =
BENCHMARKS =

if BUILD_KONJOCOIND
  bin_PROGRAMS += konjocoind
endif

if BUILD_KONJOCOIN_CLI
  bin_PROGRAMS += konjocoin-cli
endif
if BUILD_KONJOCOIN_TX
  bin_PROGRAMS += konjocoin-tx
endif
if ENABLE_WALLET
if BUILD_KONJOCOIN_WALLET
  bin_PROGRAMS += konjocoin-wallet
endif
endif

.PHONY: FORCE check-symbols check-security
# konjocoin core #
KONJOCOIN_CORE_H = \
  addrdb.h \
  addrman.h \
  attributes.h \
  banman.h \
  base58.h \
  bech32.h \
  bloom.h \
  blockencodings.h \
  blockfilter.h \
  chain.h \
  chainparams.h \
  chainparamsbase.h \
  chainparamsseeds.h \
  checkpoints.h \
  checkqueue.h \
  clientversion.h \
  coins.h \
  compat.h \
  compat/assumptions.h \
  compat/byteswap.h \
  compat/endian.h \
  compat/sanity.h \
  compressor.h \
  consensus/consensus.h \
  consensus/tx_verify.h \
  core_io.h \
  core_memusage.h \
  cuckoocache.h \
  fs.h \
  httprpc.h \
  httpserver.h \
  index/base.h \
  index/txindex.h \
  indirectmap.h \
  init.h \
  interfaces/chain.h \
  interfaces/handler.h \
  interfaces/node.h \
  interfaces/wallet.h \
  key.h \
  key_io.h \
  keystore.h \
  dbwrapper.h \
  limitedmap.h \
  logging.h \
  memusage.h \
  merkleblock.h \
  miner.h \
  net.h \
  net_processing.h \
  netaddress.h \
  netbase.h \
  netmessagemaker.h \
  node/transaction.h \
  noui.h \
  optional.h \
  outputtype.h \
  policy/feerate.h \
  policy/fees.h \
  policy/policy.h \
  policy/rbf.h \
  pow.h \
  protocol.h \
  psbt.h \
  random.h \
  reverse_iterator.h \
  reverselock.h \
  rpc/blockchain.h \
  rpc/client.h \
  rpc/mining.h \
  rpc/protocol.h \
  rpc/server.h \
  rpc/rawtransaction.h \
  rpc/register.h \
  rpc/util.h \
  scheduler.h \
  script/descriptor.h \
  script/ismine.h \
  script/sigcache.h \
  script/sign.h \
  script/standard.h \
  shutdown.h \
  streams.h \
  support/allocators/secure.h \
  support/allocators/zeroafterfree.h \
  support/cleanse.h \
  support/events.h \
  support/lockedpool.h \
  sync.h \
  threadsafety.h \
  threadinterrupt.h \
  timedata.h \
  torcontrol.h \
  txdb.h \
  txmempool.h \
  ui_interface.h \
  undo.h \
  util/bip32.h \
  util/bytevectorhash.h \
  util/system.h \
  util/memory.h \
  util/moneystr.h \
  util/time.h \
  validation.h \
  validationinterface.h \
  versionbits.h \
  versionbitsinfo.h \
  walletinitinterface.h \
  wallet/coincontrol.h \
  wallet/crypter.h \
  wallet/db.h \
  wallet/feebumper.h \
  wallet/fees.h \
  wallet/psbtwallet.h \
  wallet/rpcwallet.h \
  wallet/wallet.h \
  wallet/walletdb.h \
  wallet/wallettool.h \
  wallet/walletutil.h \
  wallet/coinselection.h \
  warnings.h \
  zmq/zmqabstractnotifier.h \
  zmq/zmqconfig.h\
  zmq/zmqnotificationinterface.h \
  zmq/zmqpublishnotifier.h \
  zmq/zmqrpc.h


obj/build.h: FORCE
	@$(MKDIR_P) $(builddir)/obj
	@$(top_srcdir)/share/genbuild.sh "$(abs_top_builddir)/src/obj/build.h" \
	  "$(abs_top_srcdir)"
libkonjocoin_util_a-clientversion.$(OBJEXT): obj/build.h

# server: shared between konjocoind and konjocoin-qt
libkonjocoin_server_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES) $(MINIUPNPC_CPPFLAGS) $(EVENT_CFLAGS) $(EVENT_PTHREADS_CFLAGS)
libkonjocoin_server_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_server_a_SOURCES = \
  addrdb.cpp \
  addrman.cpp \
  banman.cpp \
  bloom.cpp \
  blockencodings.cpp \
  blockfilter.cpp \
  chain.cpp \
  checkpoints.cpp \
  consensus/tx_verify.cpp \
  httprpc.cpp \
  httpserver.cpp \
  index/base.cpp \
  index/txindex.cpp \
  interfaces/chain.cpp \
  interfaces/handler.cpp \
  interfaces/node.cpp \
  init.cpp \
  dbwrapper.cpp \
  merkleblock.cpp \
  miner.cpp \
  net.cpp \
  net_processing.cpp \
  node/transaction.cpp \
  noui.cpp \
  outputtype.cpp \
  policy/fees.cpp \
  policy/policy.cpp \
  policy/rbf.cpp \
  pow.cpp \
  rest.cpp \
  rpc/blockchain.cpp \
  rpc/mining.cpp \
  rpc/misc.cpp \
  rpc/net.cpp \
  rpc/rawtransaction.cpp \
  rpc/server.cpp \
  rpc/util.cpp \
  script/sigcache.cpp \
  shutdown.cpp \
  timedata.cpp \
  torcontrol.cpp \
  txdb.cpp \
  txmempool.cpp \
  ui_interface.cpp \
  validation.cpp \
  validationinterface.cpp \
  versionbits.cpp \
  $(KONJOCOIN_CORE_H)

if !ENABLE_WALLET
libkonjocoin_server_a_SOURCES += dummywallet.cpp
endif

if ENABLE_ZMQ
libkonjocoin_zmq_a_CPPFLAGS = $(KONJOCOIN_INCLUDES) $(ZMQ_CFLAGS)
libkonjocoin_zmq_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_zmq_a_SOURCES = \
  zmq/zmqabstractnotifier.cpp \
  zmq/zmqnotificationinterface.cpp \
  zmq/zmqpublishnotifier.cpp \
  zmq/zmqrpc.cpp
endif


# wallet: shared between konjocoind and konjocoin-qt, but only linked
# when wallet enabled
libkonjocoin_wallet_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_wallet_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_wallet_a_SOURCES = \
  interfaces/wallet.cpp \
  wallet/coincontrol.cpp \
  wallet/crypter.cpp \
  wallet/db.cpp \
  wallet/feebumper.cpp \
  wallet/fees.cpp \
  wallet/init.cpp \
  wallet/psbtwallet.cpp \
  wallet/rpcdump.cpp \
  wallet/rpcwallet.cpp \
  wallet/wallet.cpp \
  wallet/walletdb.cpp \
  wallet/walletutil.cpp \
  wallet/coinselection.cpp \
  $(KONJOCOIN_CORE_H)

libkonjocoin_wallet_tool_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_wallet_tool_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_wallet_tool_a_SOURCES = \
  wallet/wallettool.cpp \
  $(KONJOCOIN_CORE_H)

# crypto primitives library
crypto_libkonjocoin_crypto_base_a_CPPFLAGS = $(AM_CPPFLAGS) $(SSL_CFLAGS)
crypto_libkonjocoin_crypto_base_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libkonjocoin_crypto_base_a_SOURCES = \
  crypto/aes.cpp \
  crypto/aes.h \
  crypto/chacha20.h \
  crypto/chacha20.cpp \
  crypto/common.h \
  crypto/hmac_sha256.cpp \
  crypto/hmac_sha256.h \
  crypto/hmac_sha512.cpp \
  crypto/hmac_sha512.h \
  crypto/ripemd160.cpp \
  crypto/ripemd160.h \
  crypto/scrypt.cpp \
  crypto/scrypt-sse2.cpp \
  crypto/scrypt.h \
  crypto/sha1.cpp \
  crypto/sha1.h \
  crypto/sha256.cpp \
  crypto/sha256.h \
  crypto/sha512.cpp \
  crypto/sha512.h \
  crypto/siphash.cpp \
  crypto/siphash.h

if USE_ASM
crypto_libkonjocoin_crypto_base_a_SOURCES += crypto/sha256_sse4.cpp
endif

crypto_libkonjocoin_crypto_sse41_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libkonjocoin_crypto_sse41_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libkonjocoin_crypto_sse41_a_CXXFLAGS += $(SSE41_CXXFLAGS)
crypto_libkonjocoin_crypto_sse41_a_CPPFLAGS += -DENABLE_SSE41
crypto_libkonjocoin_crypto_sse41_a_SOURCES = crypto/sha256_sse41.cpp

crypto_libkonjocoin_crypto_avx2_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libkonjocoin_crypto_avx2_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libkonjocoin_crypto_avx2_a_CXXFLAGS += $(AVX2_CXXFLAGS)
crypto_libkonjocoin_crypto_avx2_a_CPPFLAGS += -DENABLE_AVX2
crypto_libkonjocoin_crypto_avx2_a_SOURCES = crypto/sha256_avx2.cpp

crypto_libkonjocoin_crypto_shani_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libkonjocoin_crypto_shani_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libkonjocoin_crypto_shani_a_CXXFLAGS += $(SHANI_CXXFLAGS)
crypto_libkonjocoin_crypto_shani_a_CPPFLAGS += -DENABLE_SHANI
crypto_libkonjocoin_crypto_shani_a_SOURCES = crypto/sha256_shani.cpp

# consensus: shared between all executables that validate any consensus rules.
libkonjocoin_consensus_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_consensus_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_consensus_a_SOURCES = \
  amount.h \
  arith_uint256.cpp \
  arith_uint256.h \
  consensus/merkle.cpp \
  consensus/merkle.h \
  consensus/params.h \
  consensus/validation.h \
  hash.cpp \
  hash.h \
  prevector.h \
  primitives/block.cpp \
  primitives/block.h \
  primitives/transaction.cpp \
  primitives/transaction.h \
  pubkey.cpp \
  pubkey.h \
  script/konjocoinconsensus.cpp \
  script/interpreter.cpp \
  script/interpreter.h \
  script/script.cpp \
  script/script.h \
  script/script_error.cpp \
  script/script_error.h \
  serialize.h \
  span.h \
  tinyformat.h \
  uint256.cpp \
  uint256.h \
  util/strencodings.cpp \
  util/strencodings.h \
  version.h

# common: shared between konjocoind, and konjocoin-qt and non-server tools
libkonjocoin_common_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_common_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_common_a_SOURCES = \
  base58.cpp \
  bech32.cpp \
  chainparams.cpp \
  coins.cpp \
  compressor.cpp \
  core_read.cpp \
  core_write.cpp \
  key.cpp \
  key_io.cpp \
  keystore.cpp \
  netaddress.cpp \
  netbase.cpp \
  policy/feerate.cpp \
  psbt.cpp \
  protocol.cpp \
  scheduler.cpp \
  script/descriptor.cpp \
  script/ismine.cpp \
  script/sign.cpp \
  script/standard.cpp \
  versionbitsinfo.cpp \
  warnings.cpp \
  $(KONJOCOIN_CORE_H)

# util: shared between all executables.
# This library *must* be included to make sure that the glibc
# backward-compatibility objects and their sanity checks are linked.
libkonjocoin_util_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_util_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_util_a_SOURCES = \
  support/lockedpool.cpp \
  chainparamsbase.cpp \
  clientversion.cpp \
  compat/glibc_sanity.cpp \
  compat/glibcxx_sanity.cpp \
  compat/strnlen.cpp \
  fs.cpp \
  logging.cpp \
  random.cpp \
  rpc/protocol.cpp \
  support/cleanse.cpp \
  sync.cpp \
  threadinterrupt.cpp \
  util/bip32.cpp \
  util/bytevectorhash.cpp \
  util/system.cpp \
  util/moneystr.cpp \
  util/strencodings.cpp \
  util/time.cpp \
  $(KONJOCOIN_CORE_H)

if GLIBC_BACK_COMPAT
libkonjocoin_util_a_SOURCES += compat/glibc_compat.cpp
AM_LDFLAGS += $(COMPAT_LDFLAGS)
endif

# cli: shared between konjocoin-cli and konjocoin-qt
libkonjocoin_cli_a_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
libkonjocoin_cli_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libkonjocoin_cli_a_SOURCES = \
  rpc/client.cpp \
  $(KONJOCOIN_CORE_H)

nodist_libkonjocoin_util_a_SOURCES = $(srcdir)/obj/build.h
#

# konjocoind binary #
konjocoind_SOURCES = konjocoind.cpp
konjocoind_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
konjocoind_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
konjocoind_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
konjocoind_SOURCES += konjocoind-res.rc
endif

konjocoind_LDADD = \
  $(LIBKONJOCOIN_SERVER) \
  $(LIBKONJOCOIN_WALLET) \
  $(LIBKONJOCOIN_SERVER) \
  $(LIBKONJOCOIN_COMMON) \
  $(LIBUNIVALUE) \
  $(LIBKONJOCOIN_UTIL) \
  $(LIBKONJOCOIN_ZMQ) \
  $(LIBKONJOCOIN_CONSENSUS) \
  $(LIBKONJOCOIN_CRYPTO) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1)

konjocoind_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(CRYPTO_LIBS) $(MINIUPNPC_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(ZMQ_LIBS)

# konjocoin-cli binary #
konjocoin_cli_SOURCES = konjocoin-cli.cpp
konjocoin_cli_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES) $(EVENT_CFLAGS)
konjocoin_cli_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
konjocoin_cli_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
konjocoin_cli_SOURCES += konjocoin-cli-res.rc
endif

konjocoin_cli_LDADD = \
  $(LIBKONJOCOIN_CLI) \
  $(LIBUNIVALUE) \
  $(LIBKONJOCOIN_UTIL) \
  $(LIBKONJOCOIN_CRYPTO)

konjocoin_cli_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS) $(EVENT_LIBS)
#

# konjocoin-tx binary #
konjocoin_tx_SOURCES = konjocoin-tx.cpp
konjocoin_tx_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
konjocoin_tx_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
konjocoin_tx_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
konjocoin_tx_SOURCES += konjocoin-tx-res.rc
endif

konjocoin_tx_LDADD = \
  $(LIBUNIVALUE) \
  $(LIBKONJOCOIN_COMMON) \
  $(LIBKONJOCOIN_UTIL) \
  $(LIBKONJOCOIN_CONSENSUS) \
  $(LIBKONJOCOIN_CRYPTO) \
  $(LIBSECP256K1)

konjocoin_tx_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS)
#

# konjocoin-wallet binary #
konjocoin_wallet_SOURCES = konjocoin-wallet.cpp
konjocoin_wallet_CPPFLAGS = $(AM_CPPFLAGS) $(KONJOCOIN_INCLUDES)
konjocoin_wallet_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
konjocoin_wallet_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
konjocoin_wallet_SOURCES += konjocoin-wallet-res.rc
endif

konjocoin_wallet_LDADD = \
  $(LIBKONJOCOIN_WALLET_TOOL) \
  $(LIBKONJOCOIN_WALLET) \
  $(LIBKONJOCOIN_SERVER) \
  $(LIBKONJOCOIN_COMMON) \
  $(LIBKONJOCOIN_CONSENSUS) \
  $(LIBKONJOCOIN_UTIL) \
  $(LIBKONJOCOIN_CRYPTO) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1)

konjocoin_wallet_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(CRYPTO_LIBS) $(MINIUPNPC_LIBS)
#

# konjocoinconsensus library #
if BUILD_KONJOCOIN_LIBS
include_HEADERS = script/konjocoinconsensus.h
libkonjocoinconsensus_la_SOURCES = $(crypto_libkonjocoin_crypto_base_a_SOURCES) $(libkonjocoin_consensus_a_SOURCES)

if GLIBC_BACK_COMPAT
  libkonjocoinconsensus_la_SOURCES += compat/glibc_compat.cpp
endif

libkonjocoinconsensus_la_LDFLAGS = $(AM_LDFLAGS) -no-undefined $(RELDFLAGS)
libkonjocoinconsensus_la_LIBADD = $(LIBSECP256K1) $(CRYPTO_LIBS)
libkonjocoinconsensus_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(builddir)/obj -I$(srcdir)/secp256k1/include -DBUILD_KONJOCOIN_INTERNAL $(SSL_CFLAGS)
libkonjocoinconsensus_la_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)

endif
#

CTAES_DIST =  crypto/ctaes/bench.c
CTAES_DIST += crypto/ctaes/ctaes.c
CTAES_DIST += crypto/ctaes/ctaes.h
CTAES_DIST += crypto/ctaes/README.md
CTAES_DIST += crypto/ctaes/test.c

CLEANFILES = $(EXTRA_LIBRARIES)

CLEANFILES += *.gcda *.gcno
CLEANFILES += compat/*.gcda compat/*.gcno
CLEANFILES += consensus/*.gcda consensus/*.gcno
CLEANFILES += crypto/*.gcda crypto/*.gcno
CLEANFILES += policy/*.gcda policy/*.gcno
CLEANFILES += primitives/*.gcda primitives/*.gcno
CLEANFILES += script/*.gcda script/*.gcno
CLEANFILES += support/*.gcda support/*.gcno
CLEANFILES += univalue/*.gcda univalue/*.gcno
CLEANFILES += wallet/*.gcda wallet/*.gcno
CLEANFILES += wallet/test/*.gcda wallet/test/*.gcno
CLEANFILES += zmq/*.gcda zmq/*.gcno
CLEANFILES += obj/build.h

EXTRA_DIST = $(CTAES_DIST)


config/konjocoin-config.h: config/stamp-h1
	@$(MAKE) -C $(top_builddir) $(subdir)/$(@)
config/stamp-h1: $(top_srcdir)/$(subdir)/config/konjocoin-config.h.in $(top_builddir)/config.status
	$(AM_V_at)$(MAKE) -C $(top_builddir) $(subdir)/$(@)
$(top_srcdir)/$(subdir)/config/konjocoin-config.h.in:  $(am__configure_deps)
	$(AM_V_at)$(MAKE) -C $(top_srcdir) $(subdir)/config/konjocoin-config.h.in

clean-local:
	-$(MAKE) -C secp256k1 clean
	-$(MAKE) -C univalue clean
	-rm -f leveldb/*/*.gcda leveldb/*/*.gcno leveldb/helpers/memenv/*.gcda leveldb/helpers/memenv/*.gcno
	-rm -f config.h
	-rm -rf test/__pycache__

.rc.o:
	@test -f $(WINDRES)
	## FIXME: How to get the appropriate modulename_CPPFLAGS in here?
	$(AM_V_GEN) $(WINDRES) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(CPPFLAGS) -DWINDRES_PREPROC -i $< -o $@

check-symbols: $(bin_PROGRAMS)
if GLIBC_BACK_COMPAT
	@echo "Checking glibc back compat..."
	$(AM_V_at) READELF=$(READELF) CPPFILT=$(CPPFILT) $(top_srcdir)/contrib/devtools/symbol-check.py $(bin_PROGRAMS)
endif

check-security: $(bin_PROGRAMS)
if HARDEN
	@echo "Checking binary security..."
	$(AM_V_at) READELF=$(READELF) OBJDUMP=$(OBJDUMP) $(top_srcdir)/contrib/devtools/security-check.py $(bin_PROGRAMS)
endif

if ENABLE_BIP70
%.pb.cc %.pb.h: %.proto
	@test -f $(PROTOC)
	$(AM_V_GEN) $(PROTOC) --cpp_out=$(@D) --proto_path=$(<D) $<
endif

if EMBEDDED_LEVELDB
include Makefile.leveldb.include
endif

if ENABLE_TESTS
include Makefile.test.include
endif

if ENABLE_BENCH
include Makefile.bench.include
endif

if ENABLE_QT
include Makefile.qt.include
endif

if ENABLE_QT_TESTS
include Makefile.qttest.include
endif
