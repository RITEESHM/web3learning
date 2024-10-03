fn main() {
    match transaction_decoder_20::run(transaction_decoder_20::get_arg()) {
        Ok(json) => println!("{}", json),
        Err(e) => eprintln!("{}", e),
    }
}
