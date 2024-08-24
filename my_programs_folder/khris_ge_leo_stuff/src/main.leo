// The 'khris_ge_leo_stuff' program.
program khris_ge_leo_stuff.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}
