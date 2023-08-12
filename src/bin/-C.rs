#![allow(non_snake_case)]

use std::process::{Command, ExitCode};

fn main() -> ExitCode {
    let mut args = std::env::args_os();
    if args.len() <= 2 {
        return ExitCode::FAILURE;
    }
    args.next();
    let dir = args.next().unwrap();
    let cmd = args.next().unwrap();
    if Command::new(cmd)
        .args(args)
        .current_dir(dir)
        .status()
        .is_err()
    {
        return ExitCode::FAILURE;
    }
    ExitCode::SUCCESS
}
