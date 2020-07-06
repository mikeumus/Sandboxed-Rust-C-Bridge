use std::os::raw::{c_char};
use std::ffi::{CString, CStr};
use std::fs;
use std::path::Path;

#[no_mangle]
pub extern fn rust_write(to_path: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(to_path) };
    let to_path_str = match c_str.to_str() {
        Err(_) => "Error",
        Ok(string) => string,
    };
    let copy_string = to_path_str.to_string();
    let path_str = inner(&copy_string);

    CString::new(path_str).unwrap().into_raw()
}

fn inner(write_path: &str) -> String {
    let full_path = Path::new(write_path).join("test.txt");
    let data = "Some data!";

    println!("full_path: {:?}", full_path);
    fs::write(full_path.clone(), data).expect("Unable to write file");
    full_path.to_str().unwrap().to_string()
}

#[no_mangle]
pub extern fn rust_write_free(s: *mut c_char) {
    unsafe {
        if s.is_null() { return }
        CString::from_raw(s)
    };
}