#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

PYTHON_PACKAGES=(
    #"opencv-python==4.7.0.72"
)

NODES=(
    "https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved"
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet"
)

ANIMATED_MODELS=(
    "https://huggingface.co/guoyww/animatediff/resolve/main/mm_sd_v15_v2.ckpt"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_mm.ckpt"
    "https://huggingface.co/wangfuyun/AnimateLCM/resolve/main/AnimateLCM_sd15_t2v.ckpt"
    "https://huggingface.co/CiaraRowles/TemporalDiff/resolve/main/temporaldiff-v1-animatediff.safetensors?download=true"
    "https://huggingface.co/guoyww/animatediff/blob/main/mm_sd_v15.ckpt"
    "https://huggingface.co/guoyww/animatediff/blob/main/mm_sd_v14.ckpt"
    "https://huggingface.co/guoyww/animatediff/blob/main/v3_sd15_sparsectrl_rgb.ckpt"
    "https://huggingface.co/guoyww/animatediff/blob/main/v3_sd15_sparsectrl_scribble.ckpt"
)

CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/176425"
    "https://civitai.com/api/download/models/130072"
    "https://civitai.com/api/download/models/128713"
    "https://civitai.com/api/download/models/274039"   
    "https://civitai.com/api/download/models/102222?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    "https://civitai.com/api/download/models/66991?type=Model&format=SafeTensor&size=full&fp=fp16"
    "https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16"
)

LORA_MODELS=(
    "https://huggingface.co/wangfuyun/AnimateLCM/resolve/main/AnimateLCM_sd15_t2v_lora.safetensors"
    "https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SD15-8steps-lora.safetensors"
    "https://huggingface.co/guoyww/animatediff/resolve/main/v3_sd15_adapter.ckpt"
    #"https://civitai.com/api/download/models/16576"
    "https://civitai.com/api/download/models/4062?type=Model&format=SafeTensor&size=full&fp=fp16"
    "https://civitai.com/api/download/models/75826"
    "https://civitai.com/api/download/models/29149"
    "https://civitai.com/api/download/models/356744"
    "https://civitai.com/api/download/models/30574?type=Model&format=SafeTensor&size=full&fp=fp16"
    "https://civitai.com/api/download/models/63285?type=Model&format=SafeTensor"
    "https://civitai.com/api/download/models/87153?type=Model&format=SafeTensor"
    "https://civitai.com/api/download/models/93795?type=Model&format=SafeTensor"
)

VAE_MODELS=(
    "https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
)

ESRGAN_MODELS=(
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
    "https://huggingface.co/datasets/Kizi-Art/Upscale/resolve/fa98e357882a23b8e7928957a39462fbfaee1af5/4x-UltraSharp.pth"
    "https://civitai.com/api/download/models/357054?type=Model&format=PickleTensor"
)

CONTROLNET_MODELS=(
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    "https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors"
    "https://civitai.com/api/download/models/261911"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    "https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
)

MOTION_LORA=(
)

CLIP_VISION=(
    "https://huggingface.co/Beeerrggre/ipa2/resolve/main/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors"
    "https://huggingface.co/Beeerrggre/ipa2/resolve/main/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_nodes
    provisioning_install_python_packages
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/custom_nodes/ComfyUI-AnimateDiff-Evolved/models" \
        "${ANIMATED_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/clip_vision" \
        "${CLIP_VISION[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_models \    
        "${WORKSPACE}/storage/stable_diffusion/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    provisioning_get_models \ 
        "${WORKSPACE}/ComfyUI/models/animatediff_motion_lora" \
        "${MOTION_LORA[@]}"
    provisioning_print_end

}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function provisioning_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi
    
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

provisioning_start
