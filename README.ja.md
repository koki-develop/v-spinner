# v-spinner

🌀 A library for V to display customizable spinners on the command line.

<!-- TODO: demo -->

## インストール

v-spinner をあなたの `v.mod` 内の `dependencies` に追加します。

```v
// v.mod
Module {
	// ...
	dependencies: [
		// VPM からインストール
		'koki-develop.spinner'
		// GitHub からインストールする場合はこちら
		// 'https://github.com/koki-develop/v-spinner.git'
	]
}
```

この状態で `v install` を実行すれば v-spinner がインストールされます。

```console
$ v install
```

## 使い方

次のプログラムは最もシンプルな使い方の例です。

```v
module main

import time

import koki_develop.spinner // VPM からインストールした場合
// import spinner // GitHub からインストールした場合

fn main() {
	mut spin := spinner.new(spinner.character_sets[0])

	spin.start() // スピナーを表示
	time.sleep(3 * time.second)
	spin.stop()
}
```

<!-- TODO: demo -->

### 接頭辞・接尾辞を設定する

`prefix`, `suffix` を設定することで接頭辞・接尾辞をカスタマイズすることができます。

```v
module main

import time
import koki_develop.spinner // VPM からインストールした場合
// import spinner // GitHub からインストールした場合

fn main() {
	mut spin := spinner.new(spinner.character_sets[0],
		prefix: '[PREFIX] ' // optional
		suffix: ' starting up...' // optional
	)

	spin.start() // スピナーを表示
	time.sleep(2 * time.second)

	// 途中で変更することも可能
	spin.suffix = ' shutting down...'

	time.sleep(2 * time.second)
	spin.stop()
}
```

### 文字セットをカスタマイズする

いくつかの文字セットは v-spinner から提供されています。
詳しくは「[v-spinner が提供する文字セット](#v-spinner-が提供する文字セット)」を参照してください。

`spinner.new` の第一引数に任意の文字列の配列を渡すことで、任意の文字セットを使用することができます。

```v
mut spin := spinner.new(['.', '..', '...'])
```

## v-spinner が提供する文字セット

いくつかの文字セットは v-spinner から提供しており、 `spinner.character_sets[インデックス]` のようにして使用することができます。

v-spinner が提供している文字セット一覧は次の表を参照してください。

| インデックス | 文字セット |
| ------------ | ---------- |
| `0`          | `\|/-\`    |

## LICENSE

[MIT](./LICENSE)
