#!/bin/bash


# depends=("zsh" "nvim" "eza" "git") 
# missing_pack=()
# for cmd in "${depends[@]}"; do
#   if ! command -v "$cmd" >/dev/null 2>&1; then
#     missing_pack+=("$cmd")
#   fi
# done
#
# if [ ${#missing_pack[@]} -eq 0 ]; then
#   echo "Все необходимые команды установлены. Продолжаем работу скрипта."
# else
#   echo "Обнаружены отсутствующие пакеты:"
#   for missing_cmd in "${missing_pack[@]}"; do
#     echo " - $missing_cmd"
#   done
#   echo "Пожалуйста, установите отсутствующие команды и повторите запуск."
#   return 1
# fi
pkg install zsh eza git curl wget

DIR="$(dirname "$0")"
cp $DIR/../../config/.zshrc ~/.zshrc 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
