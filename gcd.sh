#!/bin/bash
#-------------------------------
# モジュール名:gcd.sh
# 処理概要    :入力された2つの整数の最大公約数を表示する
#-------------------------------

isArg() {
	if [ $1 -ne 2 ];then
		echo "Err:Param"
		exit 1
	fi
	return
}

#------------------
# 処理概要:数値チェック
# 引　　数:入力値
# 返却値  :数値=0, 数値以外=1
#------------------
isInteger() {
	# nullチェック
	if [ ! -n "$1" ];then
		echo "Err:Null"
		exit 1
	fi

	# 自然数チェック
	if expr "$1" : "^[0-9]*$" >&/dev/null;then
		if  [ "$1" -eq 0 ];then
			echo "Err:Input 0"
			exit 1
		fi
	else
		echo "Err:Not Integer"
		exit 1
	fi
	return
}

#------------------
#処理概要:最大公約数を取得する
#引　　数:自然数
#返却値  :自然数
#------------------
getGcd() {
	int1=$1
	int2=$2
	while [ $int2 -ne 0 ]
       	do
		#mod=$(( $int1 % $int2 ))
		mod=$(( $int1 % $int2 ))
		int1=$int2
		int2=$mod
	done
	echo $int1
	return $int1
}

#------------------
#  処理開始
#------------------

# 引数の数チェック
isArg $#
# 引数1の自然数チェック
isInteger $1 1
# 引数2の自然数チェック
isInteger $2 2
# 最大公約数を取得する
result=$(getGcd $1 $2)
# 最大公約数を表示する
#echo "${1}と${2}の最大公約数は${result}です。"
echo $result
exit 0



