# boringdroid_x86_64

The "boringdroid_x86_64" product defines a non-hardware-specific IA target
without a kernel or bootloader.

It can be used to build the entire user-level system, and
will work with the IA version of the emulator,

It is not a product "base class"; no other products inherit
from it or use it in any way.

The `BoardConfig.mk` is copied from `build/make/target/board/generic_x86_64/BoardConfig.mk`.

The `boringdroid_x86_64.mk` is copied from changed from `build/make/target/product/sdk_phone_x86_64.mk`.
