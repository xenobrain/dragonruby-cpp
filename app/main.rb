$gtk.ffi_misc.gtk_dlopen("ext")
include FFI::CExt

def tick(args)
  hello if args.state.tick_count.zero?
end
