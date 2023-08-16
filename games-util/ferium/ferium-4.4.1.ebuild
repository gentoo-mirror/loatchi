# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

CRATES="
	addr2line-0.20.0
	adler-1.0.2
	aho-corasick-1.0.2
	android-tzdata-0.1.1
	android_system_properties-0.1.5
	anstream-0.3.2
	anstyle-1.0.1
	anstyle-parse-0.2.1
	anstyle-query-1.0.0
	anstyle-wincon-1.0.1
	anyhow-1.0.72
	arc-swap-1.6.0
	ashpd-0.4.0
	async-broadcast-0.5.1
	async-channel-1.9.0
	async-compression-0.3.15
	async-executor-1.5.1
	async-fs-1.6.0
	async-global-executor-2.3.1
	async-io-1.13.0
	async-lock-2.7.0
	async-process-1.7.0
	async-recursion-1.0.4
	async-std-1.12.0
	async-task-4.4.0
	async-trait-0.1.72
	async_zip-0.0.12
	atomic-waker-1.1.1
	autocfg-1.1.0
	backtrace-0.3.68
	base64-0.13.1
	base64-0.21.2
	bitflags-1.3.2
	bitflags-2.3.3
	block-0.1.6
	block-buffer-0.10.4
	blocking-1.3.1
	bumpalo-3.13.0
	byteorder-1.4.3
	bytes-1.4.0
	cc-1.0.81
	cfg-if-1.0.0
	chrono-0.4.26
	clap-4.3.19
	clap_builder-4.3.19
	clap_complete-4.3.2
	clap_derive-4.3.12
	clap_lex-0.5.0
	colorchoice-1.0.0
	colored-2.0.4
	concurrent-queue-2.2.0
	console-0.15.7
	core-foundation-0.9.3
	core-foundation-sys-0.8.4
	cpufeatures-0.2.9
	crc32fast-1.3.2
	crossbeam-utils-0.8.16
	crypto-common-0.1.6
	deranged-0.3.7
	derivative-2.2.0
	dialoguer-0.10.4
	digest-0.10.7
	dispatch-0.2.0
	doc-comment-0.3.3
	either-1.9.0
	encode_unicode-0.3.6
	encoding_rs-0.8.32
	enumflags2-0.7.7
	enumflags2_derive-0.7.7
	equivalent-1.0.1
	errno-0.3.2
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fastrand-1.9.0
	fastrand-2.0.0
	ferinth-2.9.2
	flate2-1.0.26
	fnv-1.0.7
	form_urlencoded-1.2.0
	fs_extra-1.3.0
	furse-1.5.12
	futures-0.3.28
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	generic-array-0.14.7
	getrandom-0.2.10
	gimli-0.27.3
	gloo-timers-0.2.6
	h2-0.3.20
	hashbrown-0.12.3
	hashbrown-0.14.0
	heck-0.4.1
	hermit-abi-0.3.2
	hex-0.4.3
	home-0.5.5
	http-0.2.9
	http-body-0.4.5
	http-range-header-0.3.1
	httparse-1.8.0
	httpdate-1.0.2
	hyper-0.14.27
	hyper-rustls-0.24.1
	iana-time-zone-0.1.57
	iana-time-zone-haiku-0.1.2
	idna-0.4.0
	indexmap-1.9.3
	indexmap-2.0.0
	indicatif-0.17.6
	instant-0.1.12
	io-lifetimes-1.0.11
	ipnet-2.8.0
	is-terminal-0.4.9
	itertools-0.11.0
	itoa-1.0.9
	js-sys-0.3.64
	jsonwebtoken-8.3.0
	kv-log-macro-1.0.7
	lazy-regex-3.0.1
	lazy-regex-proc_macros-3.0.1
	lazy_static-1.4.0
	libc-0.2.147
	libium-1.23.2
	linux-raw-sys-0.3.8
	linux-raw-sys-0.4.5
	log-0.4.19
	malloc_buf-0.0.6
	memchr-2.5.0
	memoffset-0.7.1
	mime-0.3.17
	miniz_oxide-0.7.1
	mio-0.8.8
	murmur2-0.1.0
	nix-0.26.2
	num-bigint-0.4.3
	num-integer-0.1.45
	num-traits-0.2.16
	num_cpus-1.16.0
	number_prefix-0.4.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	object-0.31.1
	octocrab-0.29.1
	once_cell-1.18.0
	openssl-probe-0.1.5
	ordered-stream-0.2.0
	parking-2.1.0
	pem-1.1.1
	percent-encoding-2.3.0
	pin-project-1.1.3
	pin-project-internal-1.1.3
	pin-project-lite-0.2.11
	pin-utils-0.1.0
	polling-2.8.0
	pollster-0.3.0
	portable-atomic-1.4.2
	ppv-lite86-0.2.17
	proc-macro-crate-1.3.1
	proc-macro2-1.0.66
	quote-1.0.32
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	raw-window-handle-0.5.2
	redox_syscall-0.3.5
	regex-1.9.3
	regex-automata-0.3.6
	regex-syntax-0.7.4
	reqwest-0.11.18
	rfd-0.11.4
	ring-0.16.20
	rustc-demangle-0.1.23
	rustix-0.37.23
	rustix-0.38.7
	rustls-0.21.6
	rustls-native-certs-0.6.3
	rustls-pemfile-1.0.3
	rustls-webpki-0.101.2
	ryu-1.0.15
	schannel-0.1.22
	sct-0.7.0
	secrecy-0.8.0
	security-framework-2.9.2
	security-framework-sys-2.9.1
	serde-1.0.182
	serde_derive-1.0.182
	serde_json-1.0.104
	serde_path_to_error-0.1.14
	serde_repr-0.1.16
	serde_urlencoded-0.7.1
	sha1-0.10.5
	shell-words-1.1.0
	signal-hook-0.3.17
	signal-hook-registry-1.4.1
	simple_asn1-0.6.2
	size-0.4.1
	slab-0.4.8
	snafu-0.7.5
	snafu-derive-0.7.5
	socket2-0.4.9
	spin-0.5.2
	static_assertions-1.1.0
	strsim-0.10.0
	syn-1.0.109
	syn-2.0.28
	tempfile-3.7.0
	thiserror-1.0.44
	thiserror-impl-1.0.44
	time-0.1.45
	time-0.3.25
	time-core-0.1.1
	time-macros-0.2.11
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tokio-1.29.1
	tokio-macros-2.1.0
	tokio-rustls-0.24.1
	tokio-util-0.7.8
	toml_datetime-0.6.3
	toml_edit-0.19.14
	tower-0.4.13
	tower-http-0.4.3
	tower-layer-0.3.2
	tower-service-0.3.2
	tracing-0.1.37
	tracing-attributes-0.1.26
	tracing-core-0.1.31
	try-lock-0.2.4
	typenum-1.16.0
	uds_windows-1.0.2
	unicode-bidi-0.3.13
	unicode-ident-1.0.11
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	untrusted-0.7.1
	url-2.4.0
	urlencoding-2.1.3
	utf8parse-0.2.1
	value-bag-1.4.1
	version_check-0.9.4
	waker-fn-1.1.0
	want-0.3.1
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.87
	wasm-bindgen-backend-0.2.87
	wasm-bindgen-futures-0.4.37
	wasm-bindgen-macro-0.2.87
	wasm-bindgen-macro-support-0.2.87
	wasm-bindgen-shared-0.2.87
	web-sys-0.3.64
	webpki-0.22.0
	webpki-roots-0.22.6
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.44.0
	windows-0.48.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.1
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.5.4
	winreg-0.10.1
	xdg-home-1.0.0
	zbus-3.14.1
	zbus_macros-3.14.1
	zbus_names-2.6.0
	zeroize-1.6.0
	zvariant-3.15.0
	zvariant_derive-3.15.0
	zvariant_utils-1.0.1
"

inherit cargo bash-completion-r1

DESCRIPTION="Fast CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
HOMEPAGE="https://github.com/gorilla-devs/ferium"
SRC_URI="https://github.com/gorilla-devs/ferium/archive/refs/tags/v${PV}.tar.gz
    $(cargo_crate_uris)
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm ~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="/usr/bin/${PN}"

src_install() {
    default

    cargo_src_install

    cd ${WORKDIR}
    ${D}/usr/bin/ferium complete bash > ferium-bash-completion
    ${D}/usr/bin/ferium complete zsh > ferium-zsh-completion
    ${D}/usr/bin/ferium complete fish > ferium-fish-completion

    insinto /usr/share/bash-completion/completions/
    newbashcomp ferium-bash-completion ${PN}

    insinto /usr/share/zsh/site-functions/
    newins ferium-bash-completion _ferium

    insinto /usr/share/fish/vendor_completions.d/
    newins ferium-bash-completion ferium.fish
}