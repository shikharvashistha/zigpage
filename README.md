### Install Zigmod

```wget https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz -P /workspace/```

```tar -xvf /workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz -C /workspace/```

```export PATH=$PATH:/workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a/```

```rm -rf /workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz```

```wget https://github.com/nektro/zigmod/releases/download/r84/zigmod-x86_64-linux -O zigmod && chmod +x zigmod && sudo mv zigmod /usr/local/bin/ ```

```zigmod fetch```

### How to Run

```zig build run```

### Screenshot

![image](https://user-images.githubusercontent.com/51105234/218716336-d6c1474c-a9e6-4c39-964e-46299717582c.png)
