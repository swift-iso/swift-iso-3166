extension ISO_3166.Subdivision: CaseIterable {
    public static let allCases: [ISO_3166.Subdivision] = codes.split(whereSeparator: \.isWhitespace).map {
        ISO_3166.Subdivision(unchecked: String($0))
    }
}

extension ISO_3166.Subdivision {
    private static let codes = """
        ad-02 ad-03 ad-04 ad-05 ad-06 ad-07 ad-08 ae-aj ae-az ae-du ae-fu ae-rk ae-sh ae-uq af-bal
        af-bam af-bdg af-bds af-bgl af-day af-fra af-fyb af-gha af-gho af-hel af-her af-jow af-kab
        af-kan af-kap af-kdz af-kho af-knr af-lag af-log af-nan af-nim af-nur af-pan af-par af-pia
        af-pka af-sam af-sar af-tak af-uru af-war af-zab ag-03 ag-04 ag-05 ag-06 ag-07 ag-08 ag-10
        ag-11 al-01 al-02 al-03 al-04 al-05 al-06 al-07 al-08 al-09 al-10 al-11 al-12 am-ag am-ar
        am-av am-er am-gr am-kt am-lo am-sh am-su am-tv am-vd ao-bgo ao-bgu ao-bie ao-cab ao-ccu
        ao-cnn ao-cno ao-cus ao-hua ao-hui ao-lno ao-lsu ao-lua ao-mal ao-mox ao-nam ao-uig ao-zai
        ar-a ar-b ar-c ar-d ar-e ar-f ar-g ar-h ar-j ar-k ar-l ar-m ar-n ar-p ar-q ar-r ar-s ar-t
        ar-u ar-v ar-w ar-x ar-y ar-z at-1 at-2 at-3 at-4 at-5 at-6 at-7 at-8 at-9 au-act au-nsw
        au-nt au-qld au-sa au-tas au-vic au-wa az-abs az-aga az-agc az-agm az-ags az-agu az-ast
        az-ba az-bab az-bal az-bar az-bey az-bil az-cab az-cal az-cul az-das az-fuz az-ga az-gad
        az-gor az-goy az-gyg az-hac az-imi az-ism az-kal az-kan az-kur az-la az-lac az-lan az-ler
        az-mas az-mi az-na az-nef az-nv az-nx az-ogu az-ord az-qab az-qax az-qaz az-qba az-qbi
        az-qob az-qus az-sa az-sab az-sad az-sah az-sak az-sal az-sar az-sat az-sbn az-siy az-skr
        az-sm az-smi az-smx az-sr az-sus az-tar az-tov az-uca az-xa az-xac az-xci az-xiz az-xvd
        az-yar az-ye az-yev az-zan az-zaq az-zar ba-bih ba-brc ba-srp bb-01 bb-02 bb-03 bb-04 bb-05
        bb-06 bb-07 bb-08 bb-09 bb-10 bb-11 bd-01 bd-02 bd-03 bd-04 bd-05 bd-06 bd-07 bd-08 bd-09
        bd-10 bd-11 bd-12 bd-13 bd-14 bd-15 bd-16 bd-17 bd-18 bd-19 bd-20 bd-21 bd-22 bd-23 bd-24
        bd-25 bd-26 bd-27 bd-28 bd-29 bd-30 bd-31 bd-32 bd-33 bd-34 bd-35 bd-36 bd-37 bd-38 bd-39
        bd-40 bd-41 bd-42 bd-43 bd-44 bd-45 bd-46 bd-47 bd-48 bd-49 bd-50 bd-51 bd-52 bd-53 bd-54
        bd-55 bd-56 bd-57 bd-58 bd-59 bd-60 bd-61 bd-62 bd-63 bd-64 bd-a bd-b bd-c bd-d bd-e bd-f
        bd-g bd-h be-bru be-van be-vbr be-vlg be-vli be-vov be-vwv be-wal be-wbr be-wht be-wlg
        be-wlx be-wna bf-01 bf-02 bf-03 bf-04 bf-05 bf-06 bf-07 bf-08 bf-09 bf-10 bf-11 bf-12 bf-13
        bf-bal bf-bam bf-ban bf-baz bf-bgr bf-blg bf-blk bf-com bf-gan bf-gna bf-gou bf-hou bf-iob
        bf-kad bf-ken bf-kmd bf-kmp bf-kop bf-kos bf-kot bf-kow bf-ler bf-lor bf-mou bf-nam bf-nao
        bf-nay bf-nou bf-oub bf-oud bf-pas bf-pon bf-sen bf-sis bf-smt bf-sng bf-som bf-sor bf-tap
        bf-tui bf-yag bf-yat bf-zir bf-zon bf-zou bg-01 bg-02 bg-03 bg-04 bg-05 bg-06 bg-07 bg-08
        bg-09 bg-10 bg-11 bg-12 bg-13 bg-14 bg-15 bg-16 bg-17 bg-18 bg-19 bg-20 bg-21 bg-22 bg-23
        bg-24 bg-25 bg-26 bg-27 bg-28 bh-13 bh-14 bh-15 bh-17 bi-bb bi-bl bi-bm bi-br bi-ca bi-ci
        bi-gi bi-ki bi-kr bi-ky bi-ma bi-mu bi-mw bi-my bi-ng bi-rm bi-rt bi-ry bj-ak bj-al bj-aq
        bj-bo bj-co bj-do bj-ko bj-li bj-mo bj-ou bj-pl bj-zo bn-be bn-bm bn-te bn-tu bo-b bo-c
        bo-h bo-l bo-n bo-o bo-p bo-s bo-t bq-bo bq-sa bq-se br-ac br-al br-am br-ap br-ba br-ce
        br-df br-es br-go br-ma br-mg br-ms br-mt br-pa br-pb br-pe br-pi br-pr br-rj br-rn br-ro
        br-rr br-rs br-sc br-se br-sp br-to bs-ak bs-bi bs-bp bs-by bs-ce bs-ci bs-ck bs-co bs-cs
        bs-eg bs-ex bs-fp bs-gc bs-hi bs-ht bs-in bs-li bs-mc bs-mg bs-mi bs-ne bs-no bs-np bs-ns
        bs-rc bs-ri bs-sa bs-se bs-so bs-ss bs-sw bs-wg bt-11 bt-12 bt-13 bt-14 bt-15 bt-21 bt-22
        bt-23 bt-24 bt-31 bt-32 bt-33 bt-34 bt-41 bt-42 bt-43 bt-44 bt-45 bt-ga bt-ty bw-ce bw-ch
        bw-fr bw-ga bw-gh bw-jw bw-kg bw-kl bw-kw bw-lo bw-ne bw-nw bw-se bw-so bw-sp bw-st by-br
        by-hm by-ho by-hr by-ma by-mi by-vi bz-bz bz-cy bz-czl bz-ow bz-sc bz-tol ca-ab ca-bc ca-mb
        ca-nb ca-nl ca-ns ca-nt ca-nu ca-on ca-pe ca-qc ca-sk ca-yt cd-bc cd-bu cd-eq cd-hk cd-hl
        cd-hu cd-it cd-kc cd-ke cd-kg cd-kl cd-kn cd-ks cd-lo cd-lu cd-ma cd-mn cd-mo cd-nk cd-nu
        cd-sa cd-sk cd-su cd-ta cd-to cd-tu cf-ac cf-bb cf-bgf cf-bk cf-hk cf-hm cf-hs cf-kb cf-kg
        cf-lb cf-mb cf-mp cf-nm cf-op cf-se cf-uk cf-vk cg-11 cg-12 cg-13 cg-14 cg-15 cg-16 cg-2
        cg-5 cg-7 cg-8 cg-9 cg-bzv ch-ag ch-ai ch-ar ch-be ch-bl ch-bs ch-fr ch-ge ch-gl ch-gr
        ch-ju ch-lu ch-ne ch-nw ch-ow ch-sg ch-sh ch-so ch-sz ch-tg ch-ti ch-ur ch-vd ch-vs ch-zg
        ch-zh ci-ab ci-bs ci-cm ci-dn ci-gd ci-lc ci-lg ci-mg ci-sm ci-sv ci-vb ci-wr ci-ym ci-zz
        cl-ai cl-an cl-ap cl-ar cl-at cl-bi cl-co cl-li cl-ll cl-lr cl-ma cl-ml cl-nb cl-rm cl-ta
        cl-vs cm-ad cm-ce cm-en cm-es cm-lt cm-no cm-nw cm-ou cm-su cm-sw cn-ah cn-bj cn-cq cn-fj
        cn-gd cn-gs cn-gx cn-gz cn-ha cn-hb cn-he cn-hi cn-hk cn-hl cn-hn cn-jl cn-js cn-jx cn-ln
        cn-mo cn-nm cn-nx cn-qh cn-sc cn-sd cn-sh cn-sn cn-sx cn-tj cn-tw cn-xj cn-xz cn-yn cn-zj
        co-ama co-ant co-ara co-atl co-bol co-boy co-cal co-caq co-cas co-cau co-ces co-cho co-cor
        co-cun co-dc co-gua co-guv co-hui co-lag co-mag co-met co-nar co-nsa co-put co-qui co-ris
        co-san co-sap co-suc co-tol co-vac co-vau co-vid cr-a cr-c cr-g cr-h cr-l cr-p cr-sj cu-01
        cu-03 cu-04 cu-05 cu-06 cu-07 cu-08 cu-09 cu-10 cu-11 cu-12 cu-13 cu-14 cu-15 cu-16 cu-99
        cv-b cv-br cv-bv cv-ca cv-cf cv-cr cv-ma cv-mo cv-pa cv-pn cv-pr cv-rb cv-rg cv-rs cv-s
        cv-sd cv-sf cv-sl cv-sm cv-so cv-ss cv-sv cv-ta cv-ts cy-01 cy-02 cy-03 cy-04 cy-05 cy-06
        cz-10 cz-20 cz-201 cz-202 cz-203 cz-204 cz-205 cz-206 cz-207 cz-208 cz-209 cz-20a cz-20b
        cz-20c cz-31 cz-311 cz-312 cz-313 cz-314 cz-315 cz-316 cz-317 cz-32 cz-321 cz-322 cz-323
        cz-324 cz-325 cz-326 cz-327 cz-41 cz-411 cz-412 cz-413 cz-42 cz-421 cz-422 cz-423 cz-424
        cz-425 cz-426 cz-427 cz-51 cz-511 cz-512 cz-513 cz-514 cz-52 cz-521 cz-522 cz-523 cz-524
        cz-525 cz-53 cz-531 cz-532 cz-533 cz-534 cz-63 cz-631 cz-632 cz-633 cz-634 cz-635 cz-64
        cz-641 cz-642 cz-643 cz-644 cz-645 cz-646 cz-647 cz-71 cz-711 cz-712 cz-713 cz-714 cz-715
        cz-72 cz-721 cz-722 cz-723 cz-724 cz-80 cz-801 cz-802 cz-803 cz-804 cz-805 cz-806 de-bb
        de-be de-bw de-by de-hb de-he de-hh de-mv de-ni de-nw de-rp de-sh de-sl de-sn de-st de-th
        dj-ar dj-as dj-di dj-dj dj-ob dj-ta dk-81 dk-82 dk-83 dk-84 dk-85 dm-02 dm-03 dm-04 dm-05
        dm-06 dm-07 dm-08 dm-09 dm-10 dm-11 do-01 do-02 do-03 do-04 do-05 do-06 do-07 do-08 do-09
        do-10 do-11 do-12 do-13 do-14 do-15 do-16 do-17 do-18 do-19 do-20 do-21 do-22 do-23 do-24
        do-25 do-26 do-27 do-28 do-29 do-30 do-31 do-32 do-33 do-34 do-35 do-36 do-37 do-38 do-39
        do-40 do-41 do-42 dz-01 dz-02 dz-03 dz-04 dz-05 dz-06 dz-07 dz-08 dz-09 dz-10 dz-11 dz-12
        dz-13 dz-14 dz-15 dz-16 dz-17 dz-18 dz-19 dz-20 dz-21 dz-22 dz-23 dz-24 dz-25 dz-26 dz-27
        dz-28 dz-29 dz-30 dz-31 dz-32 dz-33 dz-34 dz-35 dz-36 dz-37 dz-38 dz-39 dz-40 dz-41 dz-42
        dz-43 dz-44 dz-45 dz-46 dz-47 dz-48 dz-49 dz-50 dz-51 dz-52 dz-53 dz-54 dz-55 dz-56 dz-57
        dz-58 ec-a ec-b ec-c ec-d ec-e ec-f ec-g ec-h ec-i ec-l ec-m ec-n ec-o ec-p ec-r ec-s ec-sd
        ec-se ec-t ec-u ec-w ec-x ec-y ec-z ee-130 ee-141 ee-142 ee-171 ee-184 ee-191 ee-198 ee-205
        ee-214 ee-245 ee-247 ee-251 ee-255 ee-272 ee-283 ee-284 ee-291 ee-293 ee-296 ee-303 ee-305
        ee-317 ee-321 ee-338 ee-353 ee-37 ee-39 ee-424 ee-430 ee-431 ee-432 ee-441 ee-442 ee-446
        ee-45 ee-478 ee-480 ee-486 ee-50 ee-503 ee-511 ee-514 ee-52 ee-528 ee-557 ee-56 ee-567
        ee-586 ee-60 ee-615 ee-618 ee-622 ee-624 ee-638 ee-64 ee-651 ee-653 ee-661 ee-663 ee-668
        ee-68 ee-689 ee-698 ee-708 ee-71 ee-712 ee-714 ee-719 ee-726 ee-732 ee-735 ee-74 ee-784
        ee-79 ee-792 ee-793 ee-796 ee-803 ee-809 ee-81 ee-824 ee-834 ee-84 ee-855 ee-87 ee-890
        ee-897 ee-899 ee-901 ee-903 ee-907 ee-917 ee-919 ee-928 eg-alx eg-asn eg-ast eg-ba eg-bh
        eg-bns eg-c eg-dk eg-dt eg-fym eg-gh eg-gz eg-is eg-js eg-kb eg-kfs eg-kn eg-lx eg-mn
        eg-mnf eg-mt eg-pts eg-shg eg-shr eg-sin eg-suz eg-wad er-an er-dk er-du er-gb er-ma er-sk
        es-a es-ab es-al es-an es-ar es-as es-av es-b es-ba es-bi es-bu es-c es-ca es-cb es-cc
        es-ce es-cl es-cm es-cn es-co es-cr es-cs es-ct es-cu es-ex es-ga es-gc es-gi es-gr es-gu
        es-h es-hu es-ib es-j es-l es-le es-lo es-lu es-m es-ma es-mc es-md es-ml es-mu es-na es-nc
        es-o es-or es-p es-pm es-po es-pv es-ri es-s es-sa es-se es-sg es-so es-ss es-t es-te es-tf
        es-to es-v es-va es-vc es-vi es-z es-za et-aa et-af et-am et-be et-dd et-ga et-ha et-or
        et-si et-sn et-so et-sw et-ti fi-01 fi-02 fi-03 fi-04 fi-05 fi-06 fi-07 fi-08 fi-09 fi-10
        fi-11 fi-12 fi-13 fi-14 fi-15 fi-16 fi-17 fi-18 fi-19 fj-01 fj-02 fj-03 fj-04 fj-05 fj-06
        fj-07 fj-08 fj-09 fj-10 fj-11 fj-12 fj-13 fj-14 fj-c fj-e fj-n fj-r fj-w fm-ksa fm-pni
        fm-trk fm-yap fr-01 fr-02 fr-03 fr-04 fr-05 fr-06 fr-07 fr-08 fr-09 fr-10 fr-11 fr-12 fr-13
        fr-14 fr-15 fr-16 fr-17 fr-18 fr-19 fr-20r fr-21 fr-22 fr-23 fr-24 fr-25 fr-26 fr-27 fr-28
        fr-29 fr-2a fr-2b fr-30 fr-31 fr-32 fr-33 fr-34 fr-35 fr-36 fr-37 fr-38 fr-39 fr-40 fr-41
        fr-42 fr-43 fr-44 fr-45 fr-46 fr-47 fr-48 fr-49 fr-50 fr-51 fr-52 fr-53 fr-54 fr-55 fr-56
        fr-57 fr-58 fr-59 fr-60 fr-61 fr-62 fr-63 fr-64 fr-65 fr-66 fr-67 fr-68 fr-69 fr-69m fr-6ae
        fr-70 fr-71 fr-72 fr-73 fr-74 fr-75c fr-76 fr-77 fr-78 fr-79 fr-80 fr-81 fr-82 fr-83 fr-84
        fr-85 fr-86 fr-87 fr-88 fr-89 fr-90 fr-91 fr-92 fr-93 fr-94 fr-95 fr-971 fr-972 fr-973
        fr-974 fr-976 fr-ara fr-bfc fr-bl fr-bre fr-cp fr-cvl fr-ges fr-hdf fr-idf fr-mf fr-naq
        fr-nc fr-nor fr-occ fr-pac fr-pdl fr-pf fr-pm fr-tf fr-wf ga-1 ga-2 ga-3 ga-4 ga-5 ga-6
        ga-7 ga-8 ga-9 gb-abc gb-abd gb-abe gb-agb gb-agy gb-and gb-ann gb-ans gb-bas gb-bbd gb-bcp
        gb-bdf gb-bdg gb-ben gb-bex gb-bfs gb-bge gb-bgw gb-bir gb-bkm gb-bne gb-bnh gb-bns gb-bol
        gb-bpl gb-brc gb-brd gb-bry gb-bst gb-bur gb-cam gb-cay gb-cbf gb-ccg gb-cgn gb-che gb-chw
        gb-cld gb-clk gb-cma gb-cmd gb-cmn gb-con gb-cov gb-crf gb-cry gb-cwy gb-dal gb-dby gb-den
        gb-der gb-dev gb-dgy gb-dnc gb-dnd gb-dor gb-drs gb-dud gb-dur gb-eal gb-eay gb-edh gb-edu
        gb-eln gb-els gb-enf gb-eng gb-erw gb-ery gb-ess gb-esx gb-fal gb-fif gb-fln gb-fmo gb-gat
        gb-glg gb-gls gb-gre gb-gwn gb-hal gb-ham gb-hav gb-hck gb-hef gb-hil gb-hld gb-hmf gb-hns
        gb-hpl gb-hrt gb-hrw gb-hry gb-ios gb-iow gb-isl gb-ivc gb-kec gb-ken gb-khl gb-kir gb-ktt
        gb-kwl gb-lan gb-lbc gb-lbh gb-lce gb-lds gb-lec gb-lew gb-lin gb-liv gb-lnd gb-lut gb-man
        gb-mdb gb-mdw gb-mea gb-mik gb-mln gb-mon gb-mrt gb-mry gb-mty gb-mul gb-nay gb-nbl gb-nel
        gb-net gb-nfk gb-ngm gb-nir gb-nlk gb-nln gb-nmd gb-nnh gb-nsm gb-ntl gb-ntt gb-nty gb-nwm
        gb-nwp gb-nyk gb-old gb-ork gb-oxf gb-pem gb-pkn gb-ply gb-por gb-pow gb-pte gb-rcc gb-rch
        gb-rct gb-rdb gb-rdg gb-rfw gb-ric gb-rot gb-rut gb-saw gb-say gb-scb gb-sct gb-sfk gb-sft
        gb-sgc gb-shf gb-shn gb-shr gb-skp gb-slf gb-slg gb-slk gb-snd gb-sol gb-som gb-sos gb-sry
        gb-ste gb-stg gb-sth gb-stn gb-sts gb-stt gb-sty gb-swa gb-swd gb-swk gb-tam gb-tfw gb-thr
        gb-tob gb-tof gb-trf gb-twh gb-vgl gb-war gb-wbk gb-wdu gb-wft gb-wgn gb-wil gb-wkf gb-wll
        gb-wln gb-wls gb-wlv gb-wnd gb-wnh gb-wnm gb-wok gb-wor gb-wrl gb-wrt gb-wrx gb-wsm gb-wsx
        gb-yor gb-zet gd-01 gd-02 gd-03 gd-04 gd-05 gd-06 gd-10 ge-ab ge-aj ge-gu ge-im ge-ka ge-kk
        ge-mm ge-rl ge-sj ge-sk ge-sz ge-tb gh-aa gh-af gh-ah gh-be gh-bo gh-cp gh-ep gh-ne gh-np
        gh-ot gh-sv gh-tv gh-ue gh-uw gh-wn gh-wp gl-av gl-ku gl-qe gl-qt gl-sm gm-b gm-l gm-m gm-n
        gm-u gm-w gn-b gn-be gn-bf gn-bk gn-c gn-co gn-d gn-db gn-di gn-dl gn-du gn-f gn-fa gn-fo
        gn-fr gn-ga gn-gu gn-k gn-ka gn-kb gn-kd gn-ke gn-kn gn-ko gn-ks gn-l gn-la gn-le gn-lo
        gn-m gn-mc gn-md gn-ml gn-mm gn-n gn-nz gn-pi gn-si gn-te gn-to gn-yo gq-an gq-bn gq-bs
        gq-c gq-cs gq-dj gq-i gq-kn gq-li gq-wn gr-69 gr-a gr-b gr-c gr-d gr-e gr-f gr-g gr-h gr-i
        gr-j gr-k gr-l gr-m gt-01 gt-02 gt-03 gt-04 gt-05 gt-06 gt-07 gt-08 gt-09 gt-10 gt-11 gt-12
        gt-13 gt-14 gt-15 gt-16 gt-17 gt-18 gt-19 gt-20 gt-21 gt-22 gw-ba gw-bl gw-bm gw-bs gw-ca
        gw-ga gw-l gw-n gw-oi gw-qu gw-s gw-to gy-ba gy-cu gy-de gy-eb gy-es gy-ma gy-pm gy-pt
        gy-ud gy-ut hn-at hn-ch hn-cl hn-cm hn-cp hn-cr hn-ep hn-fm hn-gd hn-ib hn-in hn-le hn-lp
        hn-oc hn-ol hn-sb hn-va hn-yo hr-01 hr-02 hr-03 hr-04 hr-05 hr-06 hr-07 hr-08 hr-09 hr-10
        hr-11 hr-12 hr-13 hr-14 hr-15 hr-16 hr-17 hr-18 hr-19 hr-20 hr-21 ht-ar ht-ce ht-ga ht-nd
        ht-ne ht-ni ht-no ht-ou ht-sd ht-se hu-ba hu-bc hu-be hu-bk hu-bu hu-bz hu-cs hu-de hu-du
        hu-eg hu-er hu-fe hu-gs hu-gy hu-hb hu-he hu-hv hu-jn hu-ke hu-km hu-kv hu-mi hu-nk hu-no
        hu-ny hu-pe hu-ps hu-sd hu-sf hu-sh hu-sk hu-sn hu-so hu-ss hu-st hu-sz hu-tb hu-to hu-va
        hu-ve hu-vm hu-za hu-ze id-ac id-ba id-bb id-be id-bt id-go id-ja id-jb id-ji id-jk id-jt
        id-jw id-ka id-kb id-ki id-kr id-ks id-kt id-ku id-la id-ma id-ml id-mu id-nb id-nt id-nu
        id-pa id-pb id-pd id-pe id-pp id-ps id-pt id-ri id-sa id-sb id-sg id-sl id-sm id-sn id-sr
        id-ss id-st id-su id-yo ie-c ie-ce ie-cn ie-co ie-cw ie-d ie-dl ie-g ie-ke ie-kk ie-ky ie-l
        ie-ld ie-lh ie-lk ie-lm ie-ls ie-m ie-mh ie-mn ie-mo ie-oy ie-rn ie-so ie-ta ie-u ie-wd
        ie-wh ie-ww ie-wx il-d il-ha il-jm il-m il-ta il-z in-an in-ap in-ar in-as in-br in-cg
        in-ch in-dh in-dl in-ga in-gj in-hp in-hr in-jh in-jk in-ka in-kl in-la in-ld in-mh in-ml
        in-mn in-mp in-mz in-nl in-od in-pb in-py in-rj in-sk in-tn in-tr in-ts in-uk in-up in-wb
        iq-an iq-ar iq-ba iq-bb iq-bg iq-da iq-di iq-dq iq-ka iq-ki iq-kr iq-ma iq-mu iq-na iq-ni
        iq-qa iq-sd iq-su iq-wa ir-00 ir-01 ir-02 ir-03 ir-04 ir-05 ir-06 ir-07 ir-08 ir-09 ir-10
        ir-11 ir-12 ir-13 ir-14 ir-15 ir-16 ir-17 ir-18 ir-19 ir-20 ir-21 ir-22 ir-23 ir-24 ir-25
        ir-26 ir-27 ir-28 ir-29 ir-30 is-1 is-2 is-3 is-4 is-5 is-6 is-7 is-8 is-akn is-aku is-arn
        is-asa is-bla is-bog is-bol is-dab is-dav is-eom is-eyf is-fjd is-fjl is-fla is-flr is-gar
        is-gog is-grn is-gru is-gry is-haf is-hrg is-hru is-hug is-huv is-hva is-hve is-isa is-kal
        is-kjo is-kop is-lan is-mos is-mul is-myr is-nor is-rge is-rgy is-rhh is-rkn is-rkv is-sbt
        is-sdn is-sdv is-sel is-sfa is-shf is-skf is-skg is-sko is-skr is-snf is-sog is-sol is-sss
        is-str is-sty is-svg is-tal is-thg is-tjo is-vem is-ver is-vop it-21 it-23 it-25 it-32
        it-34 it-36 it-42 it-45 it-52 it-55 it-57 it-62 it-65 it-67 it-72 it-75 it-77 it-78 it-82
        it-88 it-ag it-al it-an it-ap it-aq it-ar it-at it-av it-ba it-bg it-bi it-bl it-bn it-bo
        it-br it-bs it-bt it-bz it-ca it-cb it-ce it-ch it-cl it-cn it-co it-cr it-cs it-ct it-cz
        it-en it-fc it-fe it-fg it-fi it-fm it-fr it-ge it-go it-gr it-im it-is it-kr it-lc it-le
        it-li it-lo it-lt it-lu it-mb it-mc it-me it-mi it-mn it-mo it-ms it-mt it-na it-no it-nu
        it-or it-pa it-pc it-pd it-pe it-pg it-pi it-pn it-po it-pr it-pt it-pu it-pv it-pz it-ra
        it-rc it-re it-rg it-ri it-rm it-rn it-ro it-sa it-si it-so it-sp it-sr it-ss it-su it-sv
        it-ta it-te it-tn it-to it-tp it-tr it-ts it-tv it-ud it-va it-vb it-vc it-ve it-vi it-vr
        it-vt it-vv jm-01 jm-02 jm-03 jm-04 jm-05 jm-06 jm-07 jm-08 jm-09 jm-10 jm-11 jm-12 jm-13
        jm-14 jo-aj jo-am jo-aq jo-at jo-az jo-ba jo-ir jo-ja jo-ka jo-ma jo-md jo-mn jp-01 jp-02
        jp-03 jp-04 jp-05 jp-06 jp-07 jp-08 jp-09 jp-10 jp-11 jp-12 jp-13 jp-14 jp-15 jp-16 jp-17
        jp-18 jp-19 jp-20 jp-21 jp-22 jp-23 jp-24 jp-25 jp-26 jp-27 jp-28 jp-29 jp-30 jp-31 jp-32
        jp-33 jp-34 jp-35 jp-36 jp-37 jp-38 jp-39 jp-40 jp-41 jp-42 jp-43 jp-44 jp-45 jp-46 jp-47
        ke-01 ke-02 ke-03 ke-04 ke-05 ke-06 ke-07 ke-08 ke-09 ke-10 ke-11 ke-12 ke-13 ke-14 ke-15
        ke-16 ke-17 ke-18 ke-19 ke-20 ke-21 ke-22 ke-23 ke-24 ke-25 ke-26 ke-27 ke-28 ke-29 ke-30
        ke-31 ke-32 ke-33 ke-34 ke-35 ke-36 ke-37 ke-38 ke-39 ke-40 ke-41 ke-42 ke-43 ke-44 ke-45
        ke-46 ke-47 kg-b kg-c kg-gb kg-go kg-j kg-n kg-o kg-t kg-y kh-1 kh-10 kh-11 kh-12 kh-13
        kh-14 kh-15 kh-16 kh-17 kh-18 kh-19 kh-2 kh-20 kh-21 kh-22 kh-23 kh-24 kh-25 kh-3 kh-4 kh-5
        kh-6 kh-7 kh-8 kh-9 ki-g ki-l ki-p km-a km-g km-m kn-01 kn-02 kn-03 kn-04 kn-05 kn-06 kn-07
        kn-08 kn-09 kn-10 kn-11 kn-12 kn-13 kn-15 kn-k kn-n kp-01 kp-02 kp-03 kp-04 kp-05 kp-06
        kp-07 kp-08 kp-09 kp-10 kp-13 kp-14 kp-15 kr-11 kr-26 kr-27 kr-28 kr-29 kr-30 kr-31 kr-41
        kr-42 kr-43 kr-44 kr-45 kr-46 kr-47 kr-48 kr-49 kr-50 kw-ah kw-fa kw-ha kw-ja kw-ku kw-mu
        kz-10 kz-11 kz-15 kz-19 kz-23 kz-27 kz-31 kz-33 kz-35 kz-39 kz-43 kz-47 kz-55 kz-59 kz-61
        kz-62 kz-63 kz-71 kz-75 kz-79 la-at la-bk la-bl la-ch la-ho la-kh la-lm la-lp la-ou la-ph
        la-sl la-sv la-vi la-vt la-xa la-xe la-xi la-xs lb-ak lb-as lb-ba lb-bh lb-bi lb-ja lb-jl
        lb-na lc-01 lc-02 lc-03 lc-05 lc-06 lc-07 lc-08 lc-10 lc-11 lc-12 li-01 li-02 li-03 li-04
        li-05 li-06 li-07 li-08 li-09 li-10 li-11 lk-1 lk-11 lk-12 lk-13 lk-2 lk-21 lk-22 lk-23
        lk-3 lk-31 lk-32 lk-33 lk-4 lk-41 lk-42 lk-43 lk-44 lk-45 lk-5 lk-51 lk-52 lk-53 lk-6 lk-61
        lk-62 lk-7 lk-71 lk-72 lk-8 lk-81 lk-82 lk-9 lk-91 lk-92 lr-bg lr-bm lr-cm lr-gb lr-gg
        lr-gk lr-gp lr-lo lr-mg lr-mo lr-my lr-ni lr-rg lr-ri lr-si ls-a ls-b ls-c ls-d ls-e ls-f
        ls-g ls-h ls-j ls-k lt-01 lt-02 lt-03 lt-04 lt-05 lt-06 lt-07 lt-08 lt-09 lt-10 lt-11 lt-12
        lt-13 lt-14 lt-15 lt-16 lt-17 lt-18 lt-19 lt-20 lt-21 lt-22 lt-23 lt-24 lt-25 lt-26 lt-27
        lt-28 lt-29 lt-30 lt-31 lt-32 lt-33 lt-34 lt-35 lt-36 lt-37 lt-38 lt-39 lt-40 lt-41 lt-42
        lt-43 lt-44 lt-45 lt-46 lt-47 lt-48 lt-49 lt-50 lt-51 lt-52 lt-53 lt-54 lt-55 lt-56 lt-57
        lt-58 lt-59 lt-60 lt-al lt-kl lt-ku lt-mr lt-pn lt-sa lt-ta lt-te lt-ut lt-vl lu-ca lu-cl
        lu-di lu-ec lu-es lu-gr lu-lu lu-me lu-rd lu-rm lu-vd lu-wi lv-002 lv-007 lv-011 lv-015
        lv-016 lv-022 lv-026 lv-033 lv-041 lv-042 lv-047 lv-050 lv-052 lv-054 lv-056 lv-058 lv-059
        lv-062 lv-067 lv-068 lv-073 lv-077 lv-080 lv-087 lv-088 lv-089 lv-091 lv-094 lv-097 lv-099
        lv-101 lv-102 lv-106 lv-111 lv-112 lv-113 lv-dgv lv-jel lv-jur lv-lpx lv-rez lv-rix lv-ven
        ly-ba ly-bu ly-dr ly-gt ly-ja ly-jg ly-ji ly-ju ly-kf ly-mb ly-mi ly-mj ly-mq ly-nl ly-nq
        ly-sb ly-sr ly-tb ly-wa ly-wd ly-ws ly-za ma-01 ma-02 ma-03 ma-04 ma-05 ma-06 ma-07 ma-08
        ma-09 ma-10 ma-11 ma-12 ma-agd ma-aou ma-asz ma-azi ma-bem ma-ber ma-bes ma-bod ma-bom
        ma-brr ma-cas ma-che ma-chi ma-cht ma-dri ma-err ma-esi ma-esm ma-fah ma-fes ma-fig ma-fqh
        ma-gue ma-guf ma-haj ma-hao ma-hoc ma-ifr ma-ine ma-jdi ma-jra ma-ken ma-kes ma-khe ma-khn
        ma-kho ma-laa ma-lar ma-mar ma-mdf ma-med ma-mek ma-mid ma-moh ma-mou ma-nad ma-nou ma-oua
        ma-oud ma-ouj ma-ouz ma-rab ma-reh ma-saf ma-sal ma-sef ma-set ma-sib ma-sif ma-sik ma-sil
        ma-skh ma-taf ma-tai ma-tao ma-tar ma-tat ma-taz ma-tet ma-tin ma-tiz ma-tng ma-tnt ma-yus
        ma-zag mc-cl mc-co mc-fo mc-ga mc-je mc-la mc-ma mc-mc mc-mg mc-mo mc-mu mc-ph mc-sd mc-so
        mc-sp mc-sr mc-vr md-an md-ba md-bd md-br md-bs md-ca md-cl md-cm md-cr md-cs md-ct md-cu
        md-do md-dr md-du md-ed md-fa md-fl md-ga md-gl md-hi md-ia md-le md-ni md-oc md-or md-re
        md-ri md-sd md-si md-sn md-so md-st md-sv md-ta md-te md-un me-01 me-02 me-03 me-04 me-05
        me-06 me-07 me-08 me-09 me-10 me-11 me-12 me-13 me-14 me-15 me-16 me-17 me-18 me-19 me-20
        me-21 me-22 me-23 me-24 me-25 mg-a mg-d mg-f mg-m mg-t mg-u mh-alk mh-all mh-arn mh-aur
        mh-ebo mh-eni mh-jab mh-jal mh-kil mh-kwa mh-l mh-lae mh-lib mh-lik mh-maj mh-mal mh-mej
        mh-mil mh-nmk mh-nmu mh-ron mh-t mh-uja mh-uti mh-wth mh-wtj mk-101 mk-102 mk-103 mk-104
        mk-105 mk-106 mk-107 mk-108 mk-109 mk-201 mk-202 mk-203 mk-204 mk-205 mk-206 mk-207 mk-208
        mk-209 mk-210 mk-211 mk-301 mk-303 mk-304 mk-307 mk-308 mk-310 mk-311 mk-312 mk-313 mk-401
        mk-402 mk-403 mk-404 mk-405 mk-406 mk-407 mk-408 mk-409 mk-410 mk-501 mk-502 mk-503 mk-504
        mk-505 mk-506 mk-507 mk-508 mk-509 mk-601 mk-602 mk-603 mk-604 mk-605 mk-606 mk-607 mk-608
        mk-609 mk-701 mk-702 mk-703 mk-704 mk-705 mk-706 mk-801 mk-802 mk-803 mk-804 mk-805 mk-806
        mk-807 mk-808 mk-809 mk-810 mk-811 mk-812 mk-813 mk-814 mk-815 mk-816 mk-817 ml-1 ml-10
        ml-2 ml-3 ml-4 ml-5 ml-6 ml-7 ml-8 ml-9 ml-bko mm-01 mm-02 mm-03 mm-04 mm-05 mm-06 mm-07
        mm-11 mm-12 mm-13 mm-14 mm-15 mm-16 mm-17 mm-18 mn-035 mn-037 mn-039 mn-041 mn-043 mn-046
        mn-047 mn-049 mn-051 mn-053 mn-055 mn-057 mn-059 mn-061 mn-063 mn-064 mn-065 mn-067 mn-069
        mn-071 mn-073 mn-1 mr-01 mr-02 mr-03 mr-04 mr-05 mr-06 mr-07 mr-08 mr-09 mr-10 mr-11 mr-12
        mr-13 mr-14 mr-15 mt-01 mt-02 mt-03 mt-04 mt-05 mt-06 mt-07 mt-08 mt-09 mt-10 mt-11 mt-12
        mt-13 mt-14 mt-15 mt-16 mt-17 mt-18 mt-19 mt-20 mt-21 mt-22 mt-23 mt-24 mt-25 mt-26 mt-27
        mt-28 mt-29 mt-30 mt-31 mt-32 mt-33 mt-34 mt-35 mt-36 mt-37 mt-38 mt-39 mt-40 mt-41 mt-42
        mt-43 mt-44 mt-45 mt-46 mt-47 mt-48 mt-49 mt-50 mt-51 mt-52 mt-53 mt-54 mt-55 mt-56 mt-57
        mt-58 mt-59 mt-60 mt-61 mt-62 mt-63 mt-64 mt-65 mt-66 mt-67 mt-68 mu-ag mu-bl mu-cc mu-fl
        mu-gp mu-mo mu-pa mu-pl mu-pw mu-ro mu-rr mu-sa mv-00 mv-01 mv-02 mv-03 mv-04 mv-05 mv-07
        mv-08 mv-12 mv-13 mv-14 mv-17 mv-20 mv-23 mv-24 mv-25 mv-26 mv-27 mv-28 mv-29 mv-mle mw-ba
        mw-bl mw-c mw-ck mw-cr mw-ct mw-de mw-do mw-kr mw-ks mw-li mw-lk mw-mc mw-mg mw-mh mw-mu
        mw-mw mw-mz mw-n mw-nb mw-ne mw-ni mw-nk mw-ns mw-nu mw-ph mw-ru mw-s mw-sa mw-th mw-zo
        mx-agu mx-bcn mx-bcs mx-cam mx-chh mx-chp mx-cmx mx-coa mx-col mx-dur mx-gro mx-gua mx-hid
        mx-jal mx-mex mx-mic mx-mor mx-nay mx-nle mx-oax mx-pue mx-que mx-roo mx-sin mx-slp mx-son
        mx-tab mx-tam mx-tla mx-ver mx-yuc mx-zac my-01 my-02 my-03 my-04 my-05 my-06 my-07 my-08
        my-09 my-10 my-11 my-12 my-13 my-14 my-15 my-16 mz-a mz-b mz-g mz-i mz-l mz-mpm mz-n mz-p
        mz-q mz-s mz-t na-ca na-er na-ha na-ka na-ke na-kh na-ku na-kw na-od na-oh na-on na-os
        na-ot na-ow ne-1 ne-2 ne-3 ne-4 ne-5 ne-6 ne-7 ne-8 ng-ab ng-ad ng-ak ng-an ng-ba ng-be
        ng-bo ng-by ng-cr ng-de ng-eb ng-ed ng-ek ng-en ng-fc ng-go ng-im ng-ji ng-kd ng-ke ng-kn
        ng-ko ng-kt ng-kw ng-la ng-na ng-ni ng-og ng-on ng-os ng-oy ng-pl ng-ri ng-so ng-ta ng-yo
        ng-za ni-an ni-as ni-bo ni-ca ni-ci ni-co ni-es ni-gr ni-ji ni-le ni-md ni-mn ni-ms ni-mt
        ni-ns ni-ri ni-sj nl-aw nl-bq1 nl-bq2 nl-bq3 nl-cw nl-dr nl-fl nl-fr nl-ge nl-gr nl-li
        nl-nb nl-nh nl-ov nl-sx nl-ut nl-ze nl-zh no-03 no-11 no-15 no-18 no-21 no-22 no-30 no-34
        no-38 no-42 no-46 no-50 no-54 np-p1 np-p2 np-p3 np-p4 np-p5 np-p6 np-p7 nr-01 nr-02 nr-03
        nr-04 nr-05 nr-06 nr-07 nr-08 nr-09 nr-10 nr-11 nr-12 nr-13 nr-14 nz-auk nz-bop nz-can
        nz-cit nz-gis nz-hkb nz-mbh nz-mwt nz-nsn nz-ntl nz-ota nz-stl nz-tas nz-tki nz-wgn nz-wko
        nz-wtc om-bj om-bs om-bu om-da om-ma om-mu om-sj om-ss om-wu om-za om-zu pa-1 pa-10 pa-2
        pa-3 pa-4 pa-5 pa-6 pa-7 pa-8 pa-9 pa-em pa-ky pa-nb pa-nt pe-ama pe-anc pe-apu pe-are
        pe-aya pe-caj pe-cal pe-cus pe-huc pe-huv pe-ica pe-jun pe-lal pe-lam pe-lim pe-lma pe-lor
        pe-mdd pe-moq pe-pas pe-piu pe-pun pe-sam pe-tac pe-tum pe-uca pg-cpk pg-cpm pg-ebr pg-ehg
        pg-epw pg-esw pg-gpk pg-hla pg-jwk pg-mba pg-mpl pg-mpm pg-mrl pg-ncd pg-nik pg-npp pg-nsb
        pg-san pg-shm pg-wbk pg-whm pg-wpd ph-00 ph-01 ph-02 ph-03 ph-05 ph-06 ph-07 ph-08 ph-09
        ph-10 ph-11 ph-12 ph-13 ph-14 ph-15 ph-40 ph-41 ph-abr ph-agn ph-ags ph-akl ph-alb ph-ant
        ph-apa ph-aur ph-ban ph-bas ph-ben ph-bil ph-boh ph-btg ph-btn ph-buk ph-bul ph-cag ph-cam
        ph-can ph-cap ph-cas ph-cat ph-cav ph-ceb ph-com ph-dao ph-das ph-dav ph-din ph-dvo ph-eas
        ph-gui ph-ifu ph-ili ph-iln ph-ils ph-isa ph-kal ph-lag ph-lan ph-las ph-ley ph-lun ph-mad
        ph-mas ph-mdc ph-mdr ph-mgn ph-mgs ph-mou ph-msc ph-msr ph-nco ph-nec ph-ner ph-nsa ph-nue
        ph-nuv ph-pam ph-pan ph-plw ph-que ph-qui ph-riz ph-rom ph-sar ph-sco ph-sig ph-sle ph-slu
        ph-sor ph-suk ph-sun ph-sur ph-tar ph-taw ph-wsa ph-zan ph-zas ph-zmb ph-zsi pk-ba pk-gb
        pk-is pk-jk pk-kp pk-pb pk-sd pl-02 pl-04 pl-06 pl-08 pl-10 pl-12 pl-14 pl-16 pl-18 pl-20
        pl-22 pl-24 pl-26 pl-28 pl-30 pl-32 ps-bth ps-deb ps-gza ps-hbn ps-jem ps-jen ps-jrh ps-kys
        ps-nbs ps-ngz ps-qqa ps-rbh ps-rfh ps-slt ps-tbs ps-tkm pt-01 pt-02 pt-03 pt-04 pt-05 pt-06
        pt-07 pt-08 pt-09 pt-10 pt-11 pt-12 pt-13 pt-14 pt-15 pt-16 pt-17 pt-18 pt-20 pt-30 pw-002
        pw-004 pw-010 pw-050 pw-100 pw-150 pw-212 pw-214 pw-218 pw-222 pw-224 pw-226 pw-227 pw-228
        pw-350 pw-370 py-1 py-10 py-11 py-12 py-13 py-14 py-15 py-16 py-19 py-2 py-3 py-4 py-5 py-6
        py-7 py-8 py-9 py-asu qa-da qa-kh qa-ms qa-ra qa-sh qa-us qa-wa qa-za ro-ab ro-ag ro-ar
        ro-b ro-bc ro-bh ro-bn ro-br ro-bt ro-bv ro-bz ro-cj ro-cl ro-cs ro-ct ro-cv ro-db ro-dj
        ro-gj ro-gl ro-gr ro-hd ro-hr ro-if ro-il ro-is ro-mh ro-mm ro-ms ro-nt ro-ot ro-ph ro-sb
        ro-sj ro-sm ro-sv ro-tl ro-tm ro-tr ro-vl ro-vn ro-vs rs-00 rs-01 rs-02 rs-03 rs-04 rs-05
        rs-06 rs-07 rs-08 rs-09 rs-10 rs-11 rs-12 rs-13 rs-14 rs-15 rs-16 rs-17 rs-18 rs-19 rs-20
        rs-21 rs-22 rs-23 rs-24 rs-25 rs-26 rs-27 rs-28 rs-29 rs-km rs-vo ru-ad ru-al ru-alt ru-amu
        ru-ark ru-ast ru-ba ru-bel ru-bry ru-bu ru-ce ru-che ru-chu ru-cu ru-da ru-in ru-irk ru-iva
        ru-kam ru-kb ru-kc ru-kda ru-kem ru-kgd ru-kgn ru-kha ru-khm ru-kir ru-kk ru-kl ru-klu
        ru-ko ru-kos ru-kr ru-krs ru-kya ru-len ru-lip ru-mag ru-me ru-mo ru-mos ru-mow ru-mur
        ru-nen ru-ngr ru-niz ru-nvs ru-oms ru-ore ru-orl ru-per ru-pnz ru-pri ru-psk ru-ros ru-rya
        ru-sa ru-sak ru-sam ru-sar ru-se ru-smo ru-spe ru-sta ru-sve ru-ta ru-tam ru-tom ru-tul
        ru-tve ru-ty ru-tyu ru-ud ru-uly ru-vgg ru-vla ru-vlg ru-vor ru-yan ru-yar ru-yev ru-zab
        rw-01 rw-02 rw-03 rw-04 rw-05 sa-01 sa-02 sa-03 sa-04 sa-05 sa-06 sa-07 sa-08 sa-09 sa-10
        sa-11 sa-12 sa-14 sb-ce sb-ch sb-ct sb-gu sb-is sb-mk sb-ml sb-rb sb-te sb-we sc-01 sc-02
        sc-03 sc-04 sc-05 sc-06 sc-07 sc-08 sc-09 sc-10 sc-11 sc-12 sc-13 sc-14 sc-15 sc-16 sc-17
        sc-18 sc-19 sc-20 sc-21 sc-22 sc-23 sc-24 sc-25 sc-26 sc-27 sd-dc sd-de sd-dn sd-ds sd-dw
        sd-gd sd-gk sd-gz sd-ka sd-kh sd-kn sd-ks sd-nb sd-no sd-nr sd-nw sd-rs sd-si se-ab se-ac
        se-bd se-c se-d se-e se-f se-g se-h se-i se-k se-m se-n se-o se-s se-t se-u se-w se-x se-y
        se-z sg-01 sg-02 sg-03 sg-04 sg-05 sh-ac sh-hl sh-ta si-001 si-002 si-003 si-004 si-005
        si-006 si-007 si-008 si-009 si-010 si-011 si-012 si-013 si-014 si-015 si-016 si-017 si-018
        si-019 si-020 si-021 si-022 si-023 si-024 si-025 si-026 si-027 si-028 si-029 si-030 si-031
        si-032 si-033 si-034 si-035 si-036 si-037 si-038 si-039 si-040 si-041 si-042 si-043 si-044
        si-045 si-046 si-047 si-048 si-049 si-050 si-051 si-052 si-053 si-054 si-055 si-056 si-057
        si-058 si-059 si-060 si-061 si-062 si-063 si-064 si-065 si-066 si-067 si-068 si-069 si-070
        si-071 si-072 si-073 si-074 si-075 si-076 si-077 si-078 si-079 si-080 si-081 si-082 si-083
        si-084 si-085 si-086 si-087 si-088 si-089 si-090 si-091 si-092 si-093 si-094 si-095 si-096
        si-097 si-098 si-099 si-100 si-101 si-102 si-103 si-104 si-105 si-106 si-107 si-108 si-109
        si-110 si-111 si-112 si-113 si-114 si-115 si-116 si-117 si-118 si-119 si-120 si-121 si-122
        si-123 si-124 si-125 si-126 si-127 si-128 si-129 si-130 si-131 si-132 si-133 si-134 si-135
        si-136 si-137 si-138 si-139 si-140 si-141 si-142 si-143 si-144 si-146 si-147 si-148 si-149
        si-150 si-151 si-152 si-153 si-154 si-155 si-156 si-157 si-158 si-159 si-160 si-161 si-162
        si-163 si-164 si-165 si-166 si-167 si-168 si-169 si-170 si-171 si-172 si-173 si-174 si-175
        si-176 si-177 si-178 si-179 si-180 si-181 si-182 si-183 si-184 si-185 si-186 si-187 si-188
        si-189 si-190 si-191 si-192 si-193 si-194 si-195 si-196 si-197 si-198 si-199 si-200 si-201
        si-202 si-203 si-204 si-205 si-206 si-207 si-208 si-209 si-210 si-211 si-212 si-213 sk-bc
        sk-bl sk-ki sk-ni sk-pv sk-ta sk-tc sk-zi sl-e sl-n sl-nw sl-s sl-w sm-01 sm-02 sm-03 sm-04
        sm-05 sm-06 sm-07 sm-08 sm-09 sn-db sn-dk sn-fk sn-ka sn-kd sn-ke sn-kl sn-lg sn-mt sn-se
        sn-sl sn-tc sn-th sn-zg so-aw so-bk so-bn so-br so-by so-ga so-ge so-hi so-jd so-jh so-mu
        so-nu so-sa so-sd so-sh so-so so-to so-wo sr-br sr-cm sr-cr sr-ma sr-ni sr-pm sr-pr sr-sa
        sr-si sr-wa ss-bn ss-bw ss-ec ss-ee ss-ew ss-jg ss-lk ss-nu ss-uy ss-wr st-01 st-02 st-03
        st-04 st-05 st-06 st-p sv-ah sv-ca sv-ch sv-cu sv-li sv-mo sv-pa sv-sa sv-sm sv-so sv-ss
        sv-sv sv-un sv-us sy-di sy-dr sy-dy sy-ha sy-hi sy-hl sy-hm sy-id sy-la sy-qu sy-ra sy-rd
        sy-su sy-ta sz-hh sz-lu sz-ma sz-sh td-ba td-bg td-bo td-cb td-ee td-eo td-gr td-hl td-ka
        td-lc td-lo td-lr td-ma td-mc td-me td-mo td-nd td-od td-sa td-si td-ta td-ti td-wf tg-c
        tg-k tg-m tg-p tg-s th-10 th-11 th-12 th-13 th-14 th-15 th-16 th-17 th-18 th-19 th-20 th-21
        th-22 th-23 th-24 th-25 th-26 th-27 th-30 th-31 th-32 th-33 th-34 th-35 th-36 th-37 th-38
        th-39 th-40 th-41 th-42 th-43 th-44 th-45 th-46 th-47 th-48 th-49 th-50 th-51 th-52 th-53
        th-54 th-55 th-56 th-57 th-58 th-60 th-61 th-62 th-63 th-64 th-65 th-66 th-67 th-70 th-71
        th-72 th-73 th-74 th-75 th-76 th-77 th-80 th-81 th-82 th-83 th-84 th-85 th-86 th-90 th-91
        th-92 th-93 th-94 th-95 th-96 th-s tj-du tj-gb tj-kt tj-ra tj-su tl-al tl-an tl-ba tl-bo
        tl-co tl-di tl-er tl-la tl-li tl-mf tl-mt tl-oe tl-vi tm-a tm-b tm-d tm-l tm-m tm-s tn-11
        tn-12 tn-13 tn-14 tn-21 tn-22 tn-23 tn-31 tn-32 tn-33 tn-34 tn-41 tn-42 tn-43 tn-51 tn-52
        tn-53 tn-61 tn-71 tn-72 tn-73 tn-81 tn-82 tn-83 to-01 to-02 to-03 to-04 to-05 tr-01 tr-02
        tr-03 tr-04 tr-05 tr-06 tr-07 tr-08 tr-09 tr-10 tr-11 tr-12 tr-13 tr-14 tr-15 tr-16 tr-17
        tr-18 tr-19 tr-20 tr-21 tr-22 tr-23 tr-24 tr-25 tr-26 tr-27 tr-28 tr-29 tr-30 tr-31 tr-32
        tr-33 tr-34 tr-35 tr-36 tr-37 tr-38 tr-39 tr-40 tr-41 tr-42 tr-43 tr-44 tr-45 tr-46 tr-47
        tr-48 tr-49 tr-50 tr-51 tr-52 tr-53 tr-54 tr-55 tr-56 tr-57 tr-58 tr-59 tr-60 tr-61 tr-62
        tr-63 tr-64 tr-65 tr-66 tr-67 tr-68 tr-69 tr-70 tr-71 tr-72 tr-73 tr-74 tr-75 tr-76 tr-77
        tr-78 tr-79 tr-80 tr-81 tt-ari tt-cha tt-ctt tt-dmn tt-mrc tt-ped tt-pos tt-prt tt-ptf
        tt-sfo tt-sge tt-sip tt-sjl tt-tob tt-tup tv-fun tv-nit tv-nkf tv-nkl tv-nma tv-nmg tv-nui
        tv-vai tw-cha tw-cyi tw-cyq tw-hsq tw-hsz tw-hua tw-ila tw-kee tw-khh tw-kin tw-lie tw-mia
        tw-nan tw-nwt tw-pen tw-pif tw-tao tw-tnn tw-tpe tw-ttt tw-txg tw-yun tz-01 tz-02 tz-03
        tz-04 tz-05 tz-06 tz-07 tz-08 tz-09 tz-10 tz-11 tz-12 tz-13 tz-14 tz-15 tz-16 tz-17 tz-18
        tz-19 tz-20 tz-21 tz-22 tz-23 tz-24 tz-25 tz-26 tz-27 tz-28 tz-29 tz-30 tz-31 ua-05 ua-07
        ua-09 ua-12 ua-14 ua-18 ua-21 ua-23 ua-26 ua-30 ua-32 ua-35 ua-40 ua-43 ua-46 ua-48 ua-51
        ua-53 ua-56 ua-59 ua-61 ua-63 ua-65 ua-68 ua-71 ua-74 ua-77 ug-101 ug-102 ug-103 ug-104
        ug-105 ug-106 ug-107 ug-108 ug-109 ug-110 ug-111 ug-112 ug-113 ug-114 ug-115 ug-116 ug-117
        ug-118 ug-119 ug-120 ug-121 ug-122 ug-123 ug-124 ug-125 ug-126 ug-201 ug-202 ug-203 ug-204
        ug-205 ug-206 ug-207 ug-208 ug-209 ug-210 ug-211 ug-212 ug-213 ug-214 ug-215 ug-216 ug-217
        ug-218 ug-219 ug-220 ug-221 ug-222 ug-223 ug-224 ug-225 ug-226 ug-227 ug-228 ug-229 ug-230
        ug-231 ug-232 ug-233 ug-234 ug-235 ug-236 ug-237 ug-301 ug-302 ug-303 ug-304 ug-305 ug-306
        ug-307 ug-308 ug-309 ug-310 ug-311 ug-312 ug-313 ug-314 ug-315 ug-316 ug-317 ug-318 ug-319
        ug-320 ug-321 ug-322 ug-323 ug-324 ug-325 ug-326 ug-327 ug-328 ug-329 ug-330 ug-331 ug-332
        ug-333 ug-334 ug-335 ug-336 ug-337 ug-401 ug-402 ug-403 ug-404 ug-405 ug-406 ug-407 ug-408
        ug-409 ug-410 ug-411 ug-412 ug-413 ug-414 ug-415 ug-416 ug-417 ug-418 ug-419 ug-420 ug-421
        ug-422 ug-423 ug-424 ug-425 ug-426 ug-427 ug-428 ug-429 ug-430 ug-431 ug-432 ug-433 ug-434
        ug-435 ug-c ug-e ug-n ug-w um-67 um-71 um-76 um-79 um-81 um-84 um-86 um-89 um-95 us-ak
        us-al us-ar us-as us-az us-ca us-co us-ct us-dc us-de us-fl us-ga us-gu us-hi us-ia us-id
        us-il us-in us-ks us-ky us-la us-ma us-md us-me us-mi us-mn us-mo us-mp us-ms us-mt us-nc
        us-nd us-ne us-nh us-nj us-nm us-nv us-ny us-oh us-ok us-or us-pa us-pr us-ri us-sc us-sd
        us-tn us-tx us-um us-ut us-va us-vi us-vt us-wa us-wi us-wv us-wy uy-ar uy-ca uy-cl uy-co
        uy-du uy-fd uy-fs uy-la uy-ma uy-mo uy-pa uy-rn uy-ro uy-rv uy-sa uy-sj uy-so uy-ta uy-tt
        uz-an uz-bu uz-fa uz-ji uz-ng uz-nw uz-qa uz-qr uz-sa uz-si uz-su uz-tk uz-to uz-xo vc-01
        vc-02 vc-03 vc-04 vc-05 vc-06 ve-a ve-b ve-c ve-d ve-e ve-f ve-g ve-h ve-i ve-j ve-k ve-l
        ve-m ve-n ve-o ve-p ve-r ve-s ve-t ve-u ve-v ve-w ve-x ve-y ve-z vn-01 vn-02 vn-03 vn-04
        vn-05 vn-06 vn-07 vn-09 vn-13 vn-14 vn-18 vn-20 vn-21 vn-22 vn-23 vn-24 vn-25 vn-26 vn-27
        vn-28 vn-29 vn-30 vn-31 vn-32 vn-33 vn-34 vn-35 vn-36 vn-37 vn-39 vn-40 vn-41 vn-43 vn-44
        vn-45 vn-46 vn-47 vn-49 vn-50 vn-51 vn-52 vn-53 vn-54 vn-55 vn-56 vn-57 vn-58 vn-59 vn-61
        vn-63 vn-66 vn-67 vn-68 vn-69 vn-70 vn-71 vn-72 vn-73 vn-ct vn-dn vn-hn vn-hp vn-sg vu-map
        vu-pam vu-sam vu-see vu-tae vu-tob wf-al wf-sg wf-uv ws-aa ws-al ws-at ws-fa ws-ge ws-gi
        ws-pa ws-sa ws-tu ws-vf ws-vs ye-ab ye-ad ye-am ye-ba ye-da ye-dh ye-hd ye-hj ye-hu ye-ib
        ye-ja ye-la ye-ma ye-mr ye-mw ye-ra ye-sa ye-sd ye-sh ye-sn ye-su ye-ta za-ec za-fs za-gp
        za-kzn za-lp za-mp za-nc za-nw za-wc zm-01 zm-02 zm-03 zm-04 zm-05 zm-06 zm-07 zm-08 zm-09
        zm-10 zw-bu zw-ha zw-ma zw-mc zw-me zw-mi zw-mn zw-ms zw-mv zw-mw
        """
}
