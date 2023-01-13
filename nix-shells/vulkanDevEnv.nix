with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    # Vulkan packages
    vulkan-tools
    vulkan-headers
    vulkan-loader

    # Xorg
    xorg.libX11
    xorg.libXxf86vm
    xorg.libXrandr
    xorg.libXi

    # GLFW
    glfw

    # GLM
    glm

    # Shader compiler
    shaderc
  ];
}
