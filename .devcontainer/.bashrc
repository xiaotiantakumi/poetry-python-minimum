alias rebashrc='source ~/.bashrc'

function init {
    contest=$1
    for type in a b c d e f g; do
        dir_path="/code/works/abc/$contest/${type}"
        mkdir -p "$dir_path"
        cd "$dir_path"
        url="https://atcoder.jp/contests/${contest}/tasks/${contest}_${type}"
        oj d $url
        filename="main.py"
        touch $filename
    done
    cd "/code/works/abc/${contest}/a"
    code main.py
}

function to {
    echo $(pwd)
    code $(pwd)/../$1/main.py
    cd $(pwd)/../$1
}

alias test='oj t -c "python3 main.py" -d test'

function submit {
    current_dir=$(pwd)
    types=${current_dir##*/}
    contest_dir=${current_dir%/*}
    contest=${contest_dir##*/}
    cmd="oj s https://atcoder.jp/contests/${contest}/tasks/${contest}_${types} main.py"
    $cmd
}

function submit-pypy {
    current_dir=$(pwd)
    types=${current_dir##*/}
    contest_dir=${current_dir%/*}
    contest=${contest_dir##*/}
    cmd="oj s --guess-python-interpreter pypy main.py"
    $cmd
}