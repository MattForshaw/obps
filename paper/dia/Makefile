all: _build/algo.tex  _build/bandit.tex

_build:
	mkdir _build

_build/algo.tex: algo.dia _build Makefile
	dia algo.dia -e _build/temp_algo.tex -t tex
	cat _build/temp_algo.tex \
	| sed 's/@time@/$$time$$/g' \
	| sed 's/@p1@/$$P_{12}$$/g' \
	| sed 's/@p2@/$$P_2$$/g' \
	| sed 's/@p3@/$$P_1$$/g' \
	| sed 's/@m1@/$$w(1;P_{12})$$/g' \
	| sed 's/@m2@/$$w(1;P_{2})$$/g' \
	| sed 's/@m3@/$$w(1;P_{1})$$/g' \
	| sed 's/@m4@/$$w(2;P_{12})$$/g' \
	| sed 's/@m5@/$$w(2;P_{2})$$/g' \
	| sed 's/@m6@/$$w(2;P_{1})$$/g' \
	| sed 's/@upd1@/Update $$w(\\rightarrow 1;P_i)$$/g' \
	| sed 's/@upd2@/Update $$w(\\rightarrow 2;P_i)$$/g' \
	| sed 's/@pu1@/$$\\mbox{argmin}_{P_i} w(\\rightarrow 1;P_i)$$/g' \
	| sed 's/@pu2@/$$\\mbox{argmin}_{P_i} w(\\rightarrow 2;P_i)$$/g' \
	| sed 's/pgftransformxscale{.*}/pgftransformxscale{0.4}/g' \
	| sed 's/pgftransformyscale{.*}/pgftransformyscale{-0.4}/g' \
	> $@

_build/bandit.tex: bandit.dia _build Makefile
	dia bandit.dia -e _build/temp_bandit.tex -t tex
	cat _build/temp_bandit.tex \
	| sed 's/@time@/$$time$$/g' \
	| sed 's/@m1@/$$w(1;P_{1})$$/g' \
	| sed 's/@m2@/$$w(2;P_{\\mbox{bandit},2})$$/g' \
	| sed 's/@upd1@/Update $$w$$/g' \
	| sed 's/@upd2@/Update $$w$$/g' \
	| sed 's/@pu1@/$$P_{\\mbox{bandit},2}$$/g' \
	| sed 's/@pu2@/$$P_{\\mbox{bandit},3}$$/g' \
	| sed 's/pgftransformxscale{.*}/pgftransformxscale{0.4}/g' \
	| sed 's/pgftransformyscale{.*}/pgftransformyscale{-0.4}/g' \
	> $@

clean:
	rm -rf _build
