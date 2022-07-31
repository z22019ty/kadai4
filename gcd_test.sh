#!/bin/bash
#-------------------------------
# モジュール名:ggcd_test.sh
# 処理概要    :gcd.shのテストを実行する
#-------------------------------

# 変数定義
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"


#------------------
# テスト実行
#------------------

echo "step:1-1 正常動作テスト"
echo "2" > ${ans}
./gcd.sh 2 4 > ${result}
diff ${ans} ${result} || echo "error in 1-1" >> ${err}

echo "step:1-2 正常動作テスト"
echo "10" > ${ans}
./gcd.sh 30 20 > ${result}
diff ${ans} ${result} || echo "error in 1-2" >> ${err}

echo "step:2-1 異常動作テスト"
echo "Err:Param" > ${ans}
./gcd.sh 3 > ${result}
diff ${ans} ${result} || echo "error in 2-1" >> ${err}

echo "step:2-2 異常動作テスト"
echo "Err:Not Integer" > ${ans}
./gcd.sh a 2 > ${result}
diff ${ans} ${result} || echo "error in 2-2" >> ${err}

echo "step:2-3 異常動作テスト"
echo "Err:Input 0" > ${ans}
./gcd.sh 20 0 > ${result}
diff ${ans} ${result} || echo "error in 2-3" >> ${err}

echo "step:2-4 異常動作テスト"
echo "Err:Not Integer" > ${ans}
./gcd.sh 0.5 20 > ${result}
diff ${ans} ${result} || echo "error in 2-4" >> ${err}

echo "step:2-5 異常動作テスト"
echo "Err:Not Integer" > ${ans}
./gcd.sh -1 20 > ${result}
diff ${ans} ${result} || echo "error in 2-5" >> ${err}


if [ -f ${err} ]; then 
	cat ${err}
	rm /tmp/$$-*
	exit 1
fi