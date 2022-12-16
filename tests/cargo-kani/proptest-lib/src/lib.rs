// Copyright Kani Contributors
// SPDX-License-Identifier: Apache-2.0 OR MIT

//! basic proptest examples. First one fails but second does not.

#[cfg(test)]
mod test {
    use proptest::prelude::*;
    proptest! {
        /// Works fine. Shift has no overflow check.
        fn works_fine(even_num in any::<u32>().prop_map(|x| x << 1)) {
            prop_assert_eq!(even_num % 2, 0, "even number");
        }
    }

    proptest! {
        // Overflow by check in x * 2
        fn fails(even_num in any::<i32>().prop_map(|x| x * 2)) {
            prop_assert_eq!(even_num % 2, 0, "even number");
        }
    }
}
