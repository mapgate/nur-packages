{ pkgs }:
let
  inherit (pkgs) lib newScope recurseIntoAttrs libsForQt5 darwin;
in
lib.makeScope newScope (
  self: with self; {

    ### APPLICATIONS

    goldencheetah-bin = callPackage ./applications/goldencheetah/bin.nix { };
    iterm2-bin = callPackage ./applications/iterm2/bin.nix { };
    klogg = libsForQt5.callPackage ./applications/misc/klogg { };
    klogg-bin = callPackage ./applications/misc/klogg/bin.nix { };
    macpass-bin = callPackage ./applications/macpass/bin.nix { };
    synwrite-bin = callPackage ./applications/synwrite/bin.nix { };
    wireguard-statusbar-bin = callPackage ./applications/wireguard-statusbar { };

    ### BUILD SUPPORT

    fetchfromgh = callPackage ./build-support/fetchfromgh { };
    fetchgdrive = callPackage ./build-support/fetchgdrive { };
    fetchwebarchive = callPackage ./build-support/fetchwebarchive { };
    fetchymaps = callPackage ./build-support/fetchymaps { };

    ### DATA

    dadako = callPackage ./data/dicts/dadako { };
    freedict = callPackage ./data/dicts/freedict { };
    huzheng = callPackage ./data/dicts/huzheng { };
    it-sanasto = callPackage ./data/dicts/it-sanasto { };
    komputeko = callPackage ./data/dicts/komputeko { };
    tatoeba = callPackage ./data/dicts/tatoeba { };
    wiktionary = callPackage ./data/dicts/wiktionary { };

    gpsmap64 = callPackage ./data/firmwares/gpsmap64 { };

    dem = callPackage ./data/maps/dem { };
    freizeitkarte-osm = callPackage ./data/maps/freizeitkarte-osm { };
    gpxsee-maps = callPackage ./data/maps/gpxsee-maps { };
    vlasenko-maps = callPackage ./data/maps/vlasenko-maps { };
    maptourist = callPackage ./data/maps/maptourist { };
    meridian = callPackage ./data/maps/meridian { };
    mtk-suomi = callPackage ./data/maps/mtk-suomi { };
    opentopomap = callPackage ./data/maps/opentopomap { };
    qmapshack-onlinemaps = callPackage ./data/maps/qmapshack-onlinemaps { };
    slazav-hr = callPackage ./data/maps/slazav/hr.nix { };
    slazav-podm = callPackage ./data/maps/slazav/podm.nix { };
    slazav-podm-bin = callPackage ./data/maps/slazav/podm-bin.nix { };
    uralla = callPackage ./data/maps/uralla { };
    usa-osm-topo-routable = callPackage ./data/maps/usa-osm-topo-routable { };

    gadm = callPackage ./data/misc/gadm { };
    osm-extracts = callPackage ./data/misc/osm-extracts { };
    poi = callPackage ./data/misc/poi { };
    routinodb = callPackage ./data/misc/routinodb { };

    goldendict-arc-dark-theme =
      callPackage ./data/themes/goldendict-themes/arc-dark-theme.nix { };
    goldendict-dark-theme =
      callPackage ./data/themes/goldendict-themes/dark-theme.nix { };
    qtpbfimageplugin-styles = callPackage ./data/themes/qtpbfimageplugin-styles { };

    ### DEVELOPMENT / LIBRARIES

    libshell = callPackage ./development/libraries/libshell { };
    microjson = callPackage ./development/libraries/microjson { };
    qt6 = callPackage ./development/libraries/qt-6 { };

    ### DEVELOPMENT / PERL MODULES

    perlPackages = (
      callPackage ./perl-packages.nix { }
    ) // pkgs.perlPackages // {
      recurseForDerivations = false;
    };

    ### DEVELOPMENT / PYTHON MODULES

    cjkwrap = callPackage ./development/python-modules/cjkwrap { };
    bson = callPackage ./development/python-modules/bson { };
    click-6-7 = callPackage ./development/python-modules/click { };
    contextily = callPackage ./development/python-modules/contextily { };
    curses-menu = callPackage ./development/python-modules/curses-menu { };
    earthpy = callPackage ./development/python-modules/earthpy { };
    geotiler = callPackage ./development/python-modules/geotiler { };
    gpxelevations = callPackage ./development/python-modules/gpxelevations { };
    jsonseq = callPackage ./development/python-modules/jsonseq { };
    lru-dict = callPackage ./development/python-modules/lru-dict { };
    morecantile = callPackage ./development/python-modules/morecantile { };
    portolan = callPackage ./development/python-modules/portolan { };
    pymbtiles = callPackage ./development/python-modules/pymbtiles { };
    s2sphere = callPackage ./development/python-modules/s2sphere { };

    ### EMBOX

    embox-aarch64 = callPackage ./embox { arch = "aarch64"; };
    embox-arm = callPackage ./embox { arch = "arm"; };
    embox-ppc = callPackage ./embox { arch = "ppc"; };
    embox-riscv64 = callPackage ./embox { arch = "riscv64"; };
    embox-x86 = callPackage ./embox {
      stdenv = pkgs.gccMultiStdenv;
    };

    ### GARMIN

    basecamp = callPackage ./garmin/basecamp { };
    cgpsmapper = callPackage ./garmin/cgpsmapper { };
    garmin-uploader = callPackage ./garmin/garmin-uploader { };
    garminimg = libsForQt5.callPackage ./garmin/garminimg {
      proj = pkgs.proj_7;
    };
    gimgtools = callPackage ./garmin/gimgtools { };
    gmaptool = callPackage ./garmin/gmaptool { };
    imgdecode = callPackage ./garmin/imgdecode { };
    libgarmin = callPackage ./garmin/libgarmin {
      automake = pkgs.automake111x;
    };
    ocad2img = perlPackages.callPackage ./garmin/ocad2img {
      inherit cgpsmapper ocad2mp fetchwebarchive;
    };
    ocad2mp = callPackage ./garmin/ocad2mp { };
    openmtbmap = callPackage ./garmin/openmtbmap { };
    osm2mp = perlPackages.callPackage ./garmin/osm2mp {
      inherit (perlPackages) GeoOpenstreetmapParser MatchSimple MathPolygon MathPolygonTree TreeR;
    };
    sendmap20 = callPackage ./garmin/sendmap20 { };

    ### GEMINI

    agunua = callPackage ./gemini/agunua { };
    astronaut = callPackage ./gemini/astronaut { };
    comitium = callPackage ./gemini/comitium { };
    gemcert = callPackage ./gemini/gemcert { };
    gemgen = callPackage ./gemini/gemgen { };
    gemget = callPackage ./gemini/gemget { };
    gemini-ipfs-gateway = callPackage ./gemini/gemini-ipfs-gateway { };
    geminid = callPackage ./gemini/geminid { };
    gemreader = callPackage ./gemini/gemreader { };
    gemserv = callPackage ./gemini/gemserv {
      inherit (darwin.apple_sdk.frameworks) Security;
    };
    gloggery = callPackage ./gemini/gloggery { };
    gmi2html = callPackage ./gemini/gmi2html { };
    gmnhg = callPackage ./gemini/gmnhg { };
    gmnigit = callPackage ./gemini/gmnigit { };
    gssg = callPackage ./gemini/gssg { };
    gurl = callPackage ./gemini/gurl {
      zig = pkgs.zig_0_8_1;
    };
    kineto = callPackage ./gemini/kineto { };
    py-gmi2html = callPackage ./gemini/py-gmi2html { };
    qute-gemini = callPackage ./gemini/qute-gemini { };
    satellite = callPackage ./gemini/satellite { };
    shavit = callPackage ./gemini/shavit { };
    stagit-gemini = callPackage ./gemini/stagit-gemini { };
    stargazer = callPackage ./gemini/stargazer {
      inherit (darwin.apple_sdk.frameworks) Security;
    };
    tom = callPackage ./gemini/tom { };

    ### GEOSPATIAL

    arcgis2geojson = callPackage ./geospatial/arcgis2geojson { };
    datamaps = callPackage ./geospatial/datamaps { };
    elevation = callPackage ./geospatial/elevation {
      click = click-6-7;
    };
    geographiclib = callPackage ./geospatial/geographiclib { };
    go-pmtiles = callPackage ./geospatial/go-pmtiles { };
    go-staticmaps = callPackage ./geospatial/go-staticmaps { };
    mapsoft = callPackage ./geospatial/mapsoft {
      proj = pkgs.proj_7;
    };
    mapsoft2 = callPackage ./geospatial/mapsoft/2.nix {
      proj = pkgs.proj_7;
    };
    mbtiles2osmand = callPackage ./geospatial/mbtiles2osmand { };
    mbutiles = callPackage ./geospatial/mbutiles { };
    orbisgis-bin = callPackage ./geospatial/orbisgis/bin.nix { jre = pkgs.jre8; };
    pmtiles = callPackage ./geospatial/pmtiles { };
    polyvectorization = libsForQt5.callPackage ./geospatial/polyvectorization { };
    py-staticmaps = callPackage ./geospatial/py-staticmaps { };
    qgis-bin = callPackage ./geospatial/qgis/bin.nix { };
    qgis-ltr-bin = qgis-bin.override { releaseType = "ltr"; };
    qmapshack-bin = callPackage ./geospatial/qmapshack/bin.nix { };
    render_geojson = callPackage ./geospatial/render_geojson { };
    rio-mbtiles = callPackage ./geospatial/rio-mbtiles { };
    sasplanet-bin = callPackage ./geospatial/sasplanet/bin.nix { };
    supermercado = callPackage ./geospatial/supermercado { };
    tdh = callPackage ./geospatial/tdh { };
    tile-stitch = callPackage ./geospatial/tile-stitch { };
    tilesets-cli = callPackage ./geospatial/tilesets-cli { };
    tpkutils = callPackage ./geospatial/tpkutils { };
    vt2geojson = callPackage ./geospatial/vt2geojson { };

    ### GNSS

    gpstk = callPackage ./gnss/gpstk { };
    rtklib = callPackage ./gnss/rtklib { };
    visualgps = libsForQt5.callPackage ./gnss/visualgps { };

    ### GPX

    cmpgpx = callPackage ./gpx/cmpgpx { };
    garta = callPackage ./gpx/garta { };
    geojson2dm = callPackage ./gpx/geojson2dm { };
    gps-whatsnew = callPackage ./gpx/gps-whatsnew { };
    gpx-animator = callPackage ./gpx/gpx-animator { };
    gpx-cmd-tools = callPackage ./gpx/gpx-cmd-tools { };
    gpx-converter = callPackage ./gpx/gpx-converter { };
    gpx-interpolate = callPackage ./gpx/gpx-interpolate { };
    gpx-layer = perlPackages.callPackage ./gpx/gpx-layer { };
    gpx2yaml = callPackage ./gpx/gpx2yaml { };
    gpxchart = callPackage ./gpx/gpxchart { };
    gpxeditor = callPackage ./gpx/gpxeditor { };
    gpxlib = callPackage ./gpx/gpxlib { };
    gpxtools = callPackage ./gpx/gpxtools { };
    gpxtrackposter = callPackage ./gpx/gpxtrackposter { };
    trackanimation = callPackage ./gpx/trackanimation { };

    ### IMAGES

    dockerImages = {
      agate = callPackage ./images/agate { };
      elevation_server = callPackage ./images/elevation_server { };
      git = callPackage ./images/git {
        git = pkgs.gitMinimal.override {
          perlSupport = false;
          nlsSupport = false;
        };
      };
      gmnisrv = callPackage ./images/gmnisrv { };
      mbtileserver = callPackage ./images/mbtileserver { };
      quark = callPackage ./images/quark { };
      wekan = callPackage ./images/wekan { };
    };

    ### LINGUISTICS

    dict2rest = callPackage ./linguistics/dict2rest { };
    distance = callPackage ./linguistics/distance { };
    foma = callPackage ./linguistics/foma {
      libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
    };
    gdcv = callPackage ./linguistics/gdcv { };
    goldendict-bin = callPackage ./linguistics/goldendict/bin.nix { };
    gt-bash-client = callPackage ./linguistics/gt-bash-client { };
    gt4gd = callPackage ./linguistics/gt4gd { };
    hfst = callPackage ./linguistics/hfst { };
    i18n-editor-bin = callPackage ./linguistics/i18n-editor { jre = pkgs.jdk11; };
    lsdreader = callPackage ./linguistics/lsdreader { };
    mikatools = callPackage ./linguistics/mikatools { };
    odict = callPackage ./linguistics/odict { };
    opendict = callPackage ./linguistics/opendict { };
    python-hfst = callPackage ./linguistics/python-hfst { };
    pytorchtext = callPackage ./linguistics/pytorchtext { };
    redict = libsForQt5.callPackage ./linguistics/redict { };
    revtok = callPackage ./linguistics/revtok { };
    stardict-tools = callPackage ./linguistics/stardict-tools { };
    tatoebatools = callPackage ./linguistics/tatoebatools { };
    wikitextprocessor = callPackage ./linguistics/wikitextprocessor { };
    wiktextract = callPackage ./linguistics/wiktextract { };
    wiktfinnish = callPackage ./linguistics/wiktfinnish { };
    zdict = callPackage ./linguistics/zdict { };

    ### MISC

    aamath = callPackage ./misc/aamath { };
    amethyst-bin = callPackage ./misc/amethyst/bin.nix { };
    apibackuper = callPackage ./misc/apibackuper { };
    ascii-dash = callPackage ./misc/ascii-dash { };
    btpd = callPackage ./misc/btpd { };
    capture2text = libsForQt5.callPackage ./misc/capture2text { };
    cfiles = callPackage ./misc/cfiles { };
    csvquote = callPackage ./misc/csvquote { };
    csvtools = callPackage ./misc/csvtools { };
    didder = callPackage ./misc/didder { };
    docker-reg-tool = callPackage ./misc/docker-reg-tool { };
    docx2csv = callPackage ./misc/docx2csv { };
    finalcut = callPackage ./misc/finalcut { };
    gaiagpsclient = callPackage ./misc/gaiagpsclient { };
    gef = callPackage ./misc/gef { };
    glauth = callPackage ./misc/glauth { };
    how-to-use-pvs-studio-free = callPackage ./misc/pvs-studio/how-to-use-pvs-studio-free.nix { };
    huami-token = callPackage ./misc/huami-token { };
    ish = callPackage ./misc/ish { };
    lazyscraper = callPackage ./misc/lazyscraper { };
    libnbcompat = callPackage ./misc/libnbcompat { };
    md2html = callPackage ./misc/md2html { };
    miband4 = callPackage ./misc/miband4 { };
    morse-talk = callPackage ./misc/morse-talk { };
    musig = callPackage ./misc/musig { };
    nmtree = callPackage ./misc/nmtree { };
    objlab = callPackage ./misc/objlab { };
    playonmac = callPackage ./misc/playonmac { };
    pnoise = callPackage ./misc/pnoise { };
    ptunnel = callPackage ./misc/ptunnel { };
    pvs-studio = callPackage ./misc/pvs-studio { };
    qasync = callPackage ./misc/qasync { };
    qoiview = callPackage ./misc/qoiview { };
    repolocli = callPackage ./misc/repolocli { };
    sdorfehs = callPackage ./misc/sdorfehs { };
    taskcoach = callPackage ./misc/taskcoach { };
    tcvt = callPackage ./misc/tcvt { };
    telegabber = callPackage ./misc/telegabber { };
    tlstunnel = callPackage ./misc/tlstunnel { };
    xfractint = callPackage ./misc/xfractint { };
    xtr = callPackage ./misc/xtr {
      inherit (darwin.apple_sdk.frameworks) Foundation;
    };

    ### NAKARTE

    elevation_server = callPackage ./nakarte/elevation_server { };
    map-tiler = callPackage ./nakarte/map-tiler { };
    maprec = callPackage ./nakarte/maprec { };
    nakarte = callPackage ./nakarte/nakarte { };
    ozi_map = callPackage ./nakarte/ozi_map { };
    pyimagequant = callPackage ./nakarte/pyimagequant { };
    thinplatespline = callPackage ./nakarte/thinplatespline { };
    tracks_storage_server = callPackage ./nakarte/tracks_storage_server { };

    ### OSM

    imposm = callPackage ./osm/imposm { };
    map-machine = callPackage ./osm/map-machine { };
    map-stylizer = callPackage ./osm/map-stylizer { };
    maperitive-bin = callPackage ./osm/maperitive/bin.nix { };
    osm-3s = callPackage ./osm/osm-3s { };
    osm-area-tools = callPackage ./osm/osm-area-tools { };
    osm-python-tools = callPackage ./osm/osm-python-tools { };
    osm-tags-transform = callPackage ./osm/osm-tags-transform { };
    osmcoastline = callPackage ./osm/osmcoastline { };
    osmosis = callPackage ./osm/osmosis { };
    osmwalkthrough = callPackage ./osm/osmwalkthrough { };
    phyghtmap = callPackage ./osm/phyghtmap { };
    sdlmap = callPackage ./osm/sdlmap { };
    smopy = callPackage ./osm/smopy { };
    smrender = callPackage ./osm/smrender { };
    taginfo-tools = callPackage ./osm/taginfo-tools { };
    tilemaker = callPackage ./osm/tilemaker { };
    vectiler = callPackage ./osm/vectiler { };

    ### RADIO

    aprsc = callPackage ./radio/aprsc { };
    fmreceiver = libsForQt5.callPackage ./radio/fmreceiver { };
    gqrx-scanner = callPackage ./radio/gqrx-scanner { };
    linrad = callPackage ./radio/linrad { };
    rtlsdr-airband = callPackage ./radio/rtlsdr-airband { };
    sigdigger = libsForQt5.callPackage ./radio/sigdigger {
      inherit sigutils suscan suwidgets;
    };
    sigutils = callPackage ./radio/sigutils { };
    smallrx = callPackage ./radio/smallrx { };
    suscan = callPackage ./radio/suscan { };
    suwidgets = libsForQt5.callPackage ./radio/suwidgets {
      inherit sigutils;
    };

    ### SUCKLESS

    blind = callPackage ./suckless/blind { };
    chibicc = callPackage ./suckless/chibicc { };
    cproc = callPackage ./suckless/cproc { };
    dragon = callPackage ./suckless/dragon { };
    farbfeld-utils = callPackage ./suckless/farbfeld-utils { };
    ff-tools = callPackage ./suckless/ff-tools { };
    ffshot = callPackage ./suckless/ffshot { };
    hurl = callPackage ./suckless/hurl { };
    imscript = callPackage ./suckless/imscript { };
    json2tsv = callPackage ./suckless/json2tsv { };
    lacc = callPackage ./suckless/lacc { };
    lel = callPackage ./suckless/lel { };
    libgrapheme = callPackage ./suckless/libgrapheme { };
    libst = callPackage ./suckless/libst { };
    mage = callPackage ./suckless/mage { };
    makel = callPackage ./suckless/makel { };
    nextvi = callPackage ./suckless/nextvi { };
    nsxiv = callPackage ./suckless/nsxiv { };
    pista = callPackage ./suckless/pista { };
    saait = callPackage ./suckless/saait { };
    sbase = callPackage ./suckless/sbase { };
    scc = callPackage ./suckless/scc { };
    scroll = callPackage ./suckless/scroll { };
    se = callPackage ./suckless/se { };
    sthkd = callPackage ./suckless/sthkd { };
    svtm = callPackage ./suckless/svtm { };
    xprompt = callPackage ./suckless/xprompt { };
  }
)
