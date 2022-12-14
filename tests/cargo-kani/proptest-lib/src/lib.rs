// Copyright Kani Contributors
// SPDX-License-Identifier: Apache-2.0 OR MIT

//! Basic proptest examples. First one verifies, but the second one
//! does not.

#[cfg(test)]
mod test {
    use proptest::prelude::*;
    proptest! {
        /// Works fine. Shift has no overflow check.
        fn works_fine(even_num in any::<u32>().prop_map(|x| x << 1)) {
            prop_assert_eq!(even_num % 2, 0, "even number");
        }
    }

    #[cfg(not(kani))]
    mod expected {
        proptest! {
            /// Overflow by check in x * 2. TODO: Need to implement
            /// expected fail tests. tracking issue:
            /// https://github.com/model-checking/kani-github-action/issues/5
            fn fails(even_num in any::<i32>().prop_map(|x| x * 2)) {
                prop_assert_eq!(even_num % 2, 0, "even number");
            }
        }
    }
}
