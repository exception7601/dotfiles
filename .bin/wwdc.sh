#!/bin/bash

# Defina a URL da página HTML
url="$1"
# Use o comando curl para obter o conteúdo HTML da página
html=$(curl -s "$url")
# Use o Perl para extrair o link do vídeo
video_link=$(echo "$html" | perl -n -e 'print $1 if /<meta property="og:video" content="([^"]*)"/')

# Imprima o link do vídeo
echo "$video_link"

subtitle_name=wwdc

yt-dlp --list-subs "$video_link"
yt-dlp --write-sub --convert-subs=srt --sub-lang=eng --skip-download --output "${subtitle_name}" "$video_link"
trans -t pt -brief -e google -i "${subtitle_name}.eng.srt" -o ptbr.srt

# cria um buffer de 3 segundos 
# Reproduza o vídeo com o mpv e a legenda traduzida
mpv --sub-file=ptbr.srt "$video_link"
