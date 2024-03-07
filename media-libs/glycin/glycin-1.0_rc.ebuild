# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#   glycin-heif@1.0.0-beta
#   glycin-image-rs@1.0.0-beta
#   glycin-jxl@1.0.0-beta
#   glycin-svg@1.0.0-beta
#   tests@1.0.0-beta
#   tools@1.0.0-beta
CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.2
	approx@0.5.1
	async-broadcast@0.7.0
	async-channel@2.2.0
	async-executor@1.8.0
	async-fs@2.1.1
	async-global-executor@2.4.1
	async-io@2.3.1
	async-lock@2.8.0
	async-lock@3.3.0
	async-process@2.1.0
	async-recursion@1.0.5
	async-signal@0.2.5
	async-task@4.7.0
	async-trait@0.1.77
	atomic-waker@1.1.2
	autocfg@1.1.0
	backtrace@0.3.69
	bindgen@0.69.4
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.4.2
	block@0.1.6
	block-buffer@0.10.4
	blocking@1.5.1
	bytemuck@1.14.3
	byteorder@1.5.0
	bytes@1.5.0
	cairo-rs@0.19.2
	cairo-sys-rs@0.19.2
	cast@0.3.0
	cc@1.0.86
	cexpr@0.6.0
	cfg-expr@0.15.7
	cfg-if@1.0.0
	clang-sys@1.7.0
	color_quant@1.1.0
	concurrent-queue@2.4.0
	cpufeatures@0.2.12
	crc32fast@1.4.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crunchy@0.2.2
	crypto-common@0.1.6
	cssparser@0.31.2
	cssparser-macros@0.6.1
	darling@0.14.4
	darling_core@0.14.4
	darling_macro@0.14.4
	data-url@0.3.1
	derivative@2.2.0
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	derive_more@0.99.17
	digest@0.10.7
	dtoa@1.0.9
	dtoa-short@0.3.4
	dunce@1.0.4
	either@1.10.0
	encoding_rs@0.8.33
	endi@1.1.0
	enumflags2@0.7.9
	enumflags2_derive@0.7.9
	enumn@0.1.13
	equivalent@1.0.1
	errno@0.3.8
	event-listener@2.5.3
	event-listener@4.0.3
	event-listener@5.1.0
	event-listener-strategy@0.4.0
	event-listener-strategy@0.5.0
	exr@1.72.0
	fastrand@2.0.1
	fdeflate@0.3.4
	flate2@1.0.28
	float-cmp@0.9.0
	flume@0.11.0
	fnv@1.0.7
	foreign-types@0.5.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	form_urlencoded@1.2.1
	four-cc@0.3.0
	futf@0.1.5
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@2.2.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	fxhash@0.2.1
	gdk-pixbuf@0.19.2
	gdk-pixbuf-sys@0.19.0
	gdk4@0.8.0
	gdk4-sys@0.8.0
	generic-array@0.14.7
	getrandom@0.2.12
	gif@0.12.0
	gimli@0.28.1
	gio@0.19.2
	gio-sys@0.19.0
	glib@0.19.2
	glib-macros@0.19.2
	glib-sys@0.19.0
	glob@0.3.1
	glycin@1.0.0-rc
	glycin-utils@1.0.0-rc
	gobject-sys@0.19.0
	half@2.3.1
	hashbrown@0.14.3
	heck@0.4.1
	hex@0.4.3
	home@0.5.9
	ident_case@1.0.1
	idna@0.5.0
	image@0.24.8
	indexmap@2.2.3
	itertools@0.12.1
	itoa@1.0.10
	jpeg-decoder@0.3.1
	jpegxl-rs@0.8.3+libjxl-0.8.2
	jpegxl-sys@0.8.2+libjxl-0.8.2
	kamadak-exif@0.5.5
	language-tags@0.3.2
	lazy_static@1.4.0
	lazycell@1.3.0
	lcms2@6.0.4
	lcms2-sys@4.0.4
	lebe@0.5.2
	libc@0.2.153
	libheif-rs@1.0.0
	libheif-sys@2.1.0+1.17.4
	libloading@0.8.1
	librsvg@2.58.0-beta.1
	libseccomp@0.3.0
	libseccomp-sys@0.2.1
	linux-raw-sys@0.4.13
	locale_config@0.3.0
	lock_api@0.4.11
	log@0.4.20
	mac@0.1.1
	malloc_buf@0.0.6
	markup5ever@0.11.0
	matrixmultiply@0.3.8
	memchr@2.7.1
	memfd@0.6.4
	memmap2@0.9.4
	memoffset@0.9.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.10
	mutate_once@0.1.1
	nalgebra@0.32.4
	nalgebra-macros@0.2.1
	new_debug_unreachable@1.0.4
	nix@0.27.1
	nom@7.1.3
	num-complex@0.4.5
	num-integer@0.1.46
	num-rational@0.4.1
	num-traits@0.2.18
	objc@0.2.7
	objc-foundation@0.1.1
	objc_id@0.1.1
	object@0.32.2
	once_cell@1.19.0
	ordered-stream@0.2.0
	pango@0.19.2
	pango-sys@0.19.0
	pangocairo@0.19.2
	pangocairo-sys@0.19.0
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	percent-encoding@2.3.1
	phf@0.10.1
	phf@0.11.2
	phf_codegen@0.10.0
	phf_generator@0.10.0
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.10.0
	phf_shared@0.11.2
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.30
	png@0.17.13
	polling@3.5.0
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	prettyplease@0.2.16
	proc-macro-crate@1.3.1
	proc-macro-crate@3.1.0
	proc-macro2@1.0.78
	qoi@0.4.1
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rawpointer@0.2.1
	rayon@1.8.1
	rayon-core@1.12.1
	rctree@0.6.0
	redox_syscall@0.4.1
	regex@1.10.3
	regex-automata@0.4.5
	regex-syntax@0.8.2
	rgb@0.8.37
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.38.31
	safe-transmute@0.11.2
	safe_arch@0.7.1
	same-file@1.0.6
	scopeguard@1.2.0
	selectors@0.25.0
	serde@1.0.197
	serde_derive@1.0.197
	serde_repr@0.1.18
	serde_spanned@0.6.5
	servo_arc@0.3.0
	sha1@0.10.6
	shlex@1.3.0
	signal-hook-registry@1.4.1
	simba@0.8.1
	simd-adler32@0.3.7
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.5.5
	spin@0.9.8
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.50
	system-deps@6.2.0
	target-lexicon@0.12.13
	tempfile@3.10.0
	tendril@0.4.3
	thiserror@1.0.57
	thiserror-impl@1.0.57
	tiff@0.9.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.36.0
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.1
	toml_edit@0.22.6
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	typenum@1.17.0
	uds_windows@1.1.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	url@2.5.0
	utf-8@0.7.6
	vcpkg@0.2.15
	version-compare@0.1.1
	version_check@0.9.4
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	weezl@0.1.8
	which@4.4.2
	wide@0.7.15
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.40
	winnow@0.6.2
	xdg-home@1.1.0
	xml5ever@0.17.0
	zbus@4.0.1
	zbus_macros@4.0.1
	zbus_names@3.0.0
	zune-inflate@0.2.54
	zvariant@4.0.0
	zvariant_derive@4.0.0
	zvariant_utils@1.1.0
"

inherit cargo meson xdg-utils gnome2-utils

DESCRIPTION="Sandboxed and extendable image decoding"
HOMEPAGE="https://gitlab.gnome.org/sophie-h/glycin"
SRC_URI="https://gitlab.gnome.org/sophie-h/glycin/-/archive/1.0.rc/glycin-1.0.rc.tar.gz
    $(cargo_crate_uris)
"

IUSE="$IUSE heif svg webp jxl"

DEPEND="
    sys-libs/libseccomp
    heif? ( >=media-libs/libheif-1.17.0 )
    svg? ( x11-libs/cairo )
    jxl? ( media-libs/libjxl )
    webp? ( media-libs/libwebp )

    sys-apps/bubblewrap
    media-libs/lcms
    sys-devel/gettext
    sys-libs/libseccomp
"

RDEPEND="${DEPEND}"

LICENSE="LGPL-2.1 MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

S="${WORKDIR}/glycin-1.0.rc"

src_prepare(){
    default

    # cargo.eclass works with gitlab uris and gitlab.gnome.org is not considered a gitlab uri :-(
    sed -i "s/gitlab.gnome.org/github.com/g" Cargo.{toml,lock} || die

    # sed -i '/librsvg/s/.*/librsvg = { path="..\/librsvg-b831e077174ae608d8cd09e532fc0e7ce1fe5c4f" }/' Cargo.toml
    sed -i "\|CARGO_HOME|s|.*|  'CARGO_HOME': '${WORKDIR}/cargo_home',|" loaders/meson.build
}

src_configure() {

    local loaders=('glycin-image-rs')

    if use heif; then
        loaders+=('glycin-heif')
    fi

    if use svg; then
        loaders+=('glycin-svg')
    fi

    if use jxl; then
        loaders+=('glycin-jxl')
    fi

    local emesonargs=(
        -Dloaders=$(echo "${loaders%,}")
    )
    meson_src_configure
}
