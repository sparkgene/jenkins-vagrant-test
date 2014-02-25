# 仮想サーバー起動
vagrant up

# ssh 設定を出力
vagrant ssh-config --host=jenkingrant > vagrant-ssh.conf

# gem 入れる
bundle

# bootstrap = prepare + cook : Chef入れてクックブック適用
bundle exec knife solo bootstrap jenkingrant -F vagrant-ssh.conf

# serverspec でテスト実行
bundle exec rake ci:setup:rspec spec

# 設定ファイル削除
rm -f vagrant-ssh.conf

# 仮想サーバー破棄
vagrant destroy -f