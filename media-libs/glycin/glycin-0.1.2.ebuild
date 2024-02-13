# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
    addr2line-0.21.0
    adler-1.0.2
    aho-corasick-1.0.5
    anyhow-1.0.75
    approx-0.5.1
    async-broadcast-0.5.1
    async-channel-1.9.0
    async-executor-1.5.1
    async-fs-1.6.0
    async-global-executor-2.3.1
    async-io-1.13.0
    async-lock-2.8.0
    async-process-1.7.0
    async-recursion-1.0.5
    async-std-1.12.0
    async-task-4.4.0
    async-trait-0.1.73
    atomic-waker-1.1.1
    autocfg-1.1.0
    backtrace-0.3.69
    bit_field-0.10.2
    bitflags-1.3.2
    bitflags-2.4.0
    block-0.1.6
    block-buffer-0.10.4
    blocking-1.3.1
    bumpalo-3.13.0
    bytemuck-1.13.1
    byteorder-1.4.3
    cairo-rs-0.18.0
    cairo-sys-rs-0.18.0
    cast-0.3.0
    cc-1.0.83
    cfg-expr-0.15.4
    cfg-if-1.0.0
    color_quant-1.1.0
    concurrent-queue-2.2.0
    cpufeatures-0.2.9
    crc32fast-1.3.2
    crossbeam-channel-0.5.8
    crossbeam-deque-0.8.3
    crossbeam-epoch-0.9.15
    crossbeam-utils-0.8.16
    crunchy-0.2.2
    crypto-common-0.1.6
    cssparser-0.31.2
    cssparser-macros-0.6.1
    data-url-0.3.0
    derivative-2.2.0
    derive_more-0.99.17
    digest-0.10.7
    dtoa-1.0.9
    dtoa-short-0.3.4
    dunce-1.0.4
    either-1.9.0
    encoding_rs-0.8.33
    enumflags2-0.7.7
    enumflags2_derive-0.7.7
    enumn-0.1.12
    equivalent-1.0.1
    errno-0.3.3
    errno-dragonfly-0.1.2
    event-listener-2.5.3
    exr-1.7.0
    fastrand-1.9.0
    fastrand-2.0.0
    fdeflate-0.3.0
    flate2-1.0.27
    float-cmp-0.9.0
    flume-0.10.14
    foreign-types-0.5.0
    foreign-types-macros-0.2.3
    foreign-types-shared-0.3.1
    form_urlencoded-1.2.0
    four-cc-0.3.0
    futf-0.1.5
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
    fxhash-0.2.1
    gdk4-0.7.2
    gdk4-sys-0.7.2
    gdk-pixbuf-0.18.0
    gdk-pixbuf-sys-0.18.0
    generic-array-0.14.7
    getrandom-0.2.10
    gettext-rs-0.7.0
    gettext-sys-0.21.3
    gif-0.12.0
    gimli-0.28.0
    gio-0.18.1
    gio-sys-0.18.1
    glib-0.18.1
    glib-macros-0.18.0
    glib-sys-0.18.1
    gloo-timers-0.2.6
    gobject-sys-0.18.0
    half-2.2.1
    hashbrown-0.14.0
    heck-0.4.1
    hermit-abi-0.3.2
    hex-0.4.3
    idna-0.4.0
    image-0.24.7
    indexmap-2.0.0
    instant-0.1.12
    io-lifetimes-1.0.11
    itertools-0.11.0
    itoa-1.0.9
    jobserver-0.1.26
    jpeg-decoder-0.3.0
    js-sys-0.3.64
    jxl-bitstream-0.2.3
    jxl-coding-0.2.3
    jxl-color-0.3.2
    jxl-frame-0.4.0
    jxl-grid-0.1.1
    jxl-image-0.4.1
    jxl-modular-0.2.2
    jxl-oxide-0.3.0
    jxl-render-0.3.0
    jxl-vardct-0.2.1
    kamadak-exif-0.5.5
    kv-log-macro-1.0.7
    language-tags-0.3.2
    lazy_static-1.4.0
    lcms2-5.6.0
    lcms2-sys-4.0.3
    lebe-0.5.2
    libc-0.2.147
    libheif-rs-0.20.0
    libheif-sys-1.16.1
    librsvg-2.57.0
    linux-raw-sys-0.3.8
    linux-raw-sys-0.4.5
    locale_config-0.3.0
    lock_api-0.4.10
    log-0.4.20
    mac-0.1.1
    malloc_buf-0.0.6
    markup5ever-0.11.0
    matrixmultiply-0.3.7
    memchr-2.6.3
    memfd-0.6.3
    memmap2-0.7.1
    memoffset-0.7.1
    memoffset-0.9.0
    miniz_oxide-0.7.1
    mutate_once-0.1.1
    nalgebra-0.32.3
    nalgebra-macros-0.2.1
    nanorand-0.7.0
    new_debug_unreachable-1.0.4
    nix-0.26.4
    num-complex-0.4.4
    num_cpus-1.16.0
    num-integer-0.1.45
    num-rational-0.4.1
    num-traits-0.2.16
    objc-0.2.7
    objc-foundation-0.1.1
    objc_id-0.1.1
    object-0.32.1
    once_cell-1.18.0
    ordered-stream-0.2.0
    pango-0.18.0
    pangocairo-0.18.0
    pangocairo-sys-0.18.0
    pango-sys-0.18.0
    parking-2.1.0
    parking_lot-0.12.1
    parking_lot_core-0.9.8
    paste-1.0.14
    percent-encoding-2.3.0
    phf-0.10.1
    phf-0.11.2
    phf_codegen-0.10.0
    phf_generator-0.10.0
    phf_generator-0.11.2
    phf_macros-0.11.2
    phf_shared-0.10.0
    phf_shared-0.11.2
    pin-project-1.1.3
    pin-project-internal-1.1.3
    pin-project-lite-0.2.13
    pin-utils-0.1.0
    pkg-config-0.3.27
    png-0.17.10
    polling-2.8.0
    ppv-lite86-0.2.17
    precomputed-hash-0.1.1
    proc-macro2-1.0.66
    proc-macro-crate-1.3.1
    proc-macro-error-1.0.4
    proc-macro-error-attr-1.0.4
    qoi-0.4.1
    quote-1.0.33
    rand-0.8.5
    rand_chacha-0.3.1
    rand_core-0.6.4
    rawpointer-0.2.1
    rayon-1.7.0
    rayon-core-1.11.0
    rctree-0.5.0
    redox_syscall-0.3.5
    regex-1.9.5
    regex-automata-0.3.8
    regex-syntax-0.7.5
    rgb-0.8.36
    rustc-demangle-0.1.23
    rustix-0.37.23
    rustix-0.38.11
    safe_arch-0.7.1
    safe-transmute-0.11.2
    scopeguard-1.2.0
    selectors-0.25.0
    serde-1.0.188
    serde_derive-1.0.188
    serde_repr-0.1.16
    serde_spanned-0.6.3
    servo_arc-0.3.0
    sha1-0.10.5
    signal-hook-0.3.17
    signal-hook-registry-1.4.1
    simba-0.8.1
    simd-adler32-0.3.7
    siphasher-0.3.11
    slab-0.4.9
    smallvec-1.11.0
    socket2-0.4.9
    spin-0.9.8
    stable_deref_trait-1.2.0
    static_assertions-1.1.0
    string_cache-0.8.7
    string_cache_codegen-0.5.2
    syn-1.0.109
    syn-2.0.30
    system-deps-6.1.1
    target-lexicon-0.12.11
    temp-dir-0.1.11
    tempfile-3.8.0
    tendril-0.4.3
    thiserror-1.0.48
    thiserror-impl-1.0.48
    tiff-0.9.0
    tinyvec-1.6.0
    tinyvec_macros-0.1.1
    toml-0.7.6
    toml_datetime-0.6.3
    toml_edit-0.19.14
    tracing-0.1.37
    tracing-attributes-0.1.26
    tracing-core-0.1.31
    typenum-1.16.0
    uds_windows-1.0.2
    unicode-bidi-0.3.13
    unicode-ident-1.0.11
    unicode-normalization-0.1.22
    url-2.4.1
    utf-8-0.7.6
    value-bag-1.4.1
    vcpkg-0.2.15
    version_check-0.9.4
    version-compare-0.1.1
    waker-fn-1.1.0
    wasi-0.11.0+wasi-snapshot-preview1
    wasm-bindgen-0.2.87
    wasm-bindgen-backend-0.2.87
    wasm-bindgen-futures-0.4.37
    wasm-bindgen-macro-0.2.87
    wasm-bindgen-macro-support-0.2.87
    wasm-bindgen-shared-0.2.87
    web-sys-0.3.64
    weezl-0.1.7
    wide-0.7.11
    winapi-0.3.9
    winapi-i686-pc-windows-gnu-0.4.0
    winapi-x86_64-pc-windows-gnu-0.4.0
    windows_aarch64_gnullvm-0.48.5
    windows_aarch64_msvc-0.48.5
    windows_i686_gnu-0.48.5
    windows_i686_msvc-0.48.5
    windows-sys-0.48.0
    windows-targets-0.48.5
    windows_x86_64_gnu-0.48.5
    windows_x86_64_gnullvm-0.48.5
    windows_x86_64_msvc-0.48.5
    winnow-0.5.15
    xdg-home-1.0.0
    xml5ever-0.17.0
    zbus-3.14.1
    zbus_macros-3.14.1
    zbus_names-2.6.0
    zune-inflate-0.2.54
    zvariant-3.15.0
    zvariant_derive-3.15.0
    zvariant_utils-1.0.1
"

inherit cargo meson xdg-utils gnome2-utils

DESCRIPTION="Sandboxed and extendable image decoding"
HOMEPAGE="https://gitlab.gnome.org/sophie-h/glycin"
SRC_URI="https://gitlab.gnome.org/sophie-h/glycin/-/archive/${PV}/glycin-${PV}.tar.gz
    $(cargo_crate_uris)
"

IUSE="$IUSE heif svg webp jxl"

DEPEND="
    >=gui-libs/gtk-4.12.0
    heif? ( >=media-libs/libheif-1.14.2 )
    svg? ( x11-libs/cairo )
    webp? ( media-libs/libwebp )
    jxl? ( media-libs/libjxl )
"

RDEPEND="${DEPEND}"

LICENSE="LGPL-2.1 MPL-2.0"
SLOT="0"
KEYWORDS="amd64"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_prepare(){
    default

    # cargo.eclass works with gitlab uris and gitlab.gnome.org is not considered a gitlab uri :-(
    sed -i "s/gitlab.gnome.org/github.com/g" Cargo.{toml,lock} || die

    # sed -i '/librsvg/s/.*/librsvg = { path="..\/librsvg-b831e077174ae608d8cd09e532fc0e7ce1fe5c4f" }/' Cargo.toml
    sed -i "\|CARGO_HOME|s|.*|  'CARGO_HOME': '${WORKDIR}/cargo_home',|" loaders/meson.build
}

src_configure() {

    local loaders=('glycin-image-rs','glycin-jxl')

    if use heif; then
        loaders+=('glycin-heif')
    fi

    if use svg; then
        loaders+=('glycin-svg')
    fi

    local emesonargs=(
        -Dloaders=$(echo "${loaders%,}")
    )
    meson_src_configure
}
