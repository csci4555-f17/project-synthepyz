# Reference Implementation

This is a partial implementation of Synthepyz. It will not generate test cases for you, but if you provide test cases (in the body of the program), it will search for a program that satisfies them.

## How do I run this?

This program is written in Rust. You will need a Rust nighly toolchain to compile it. Once you have one, create a new project

`cargo new --bin synthepyz`

And place the main.rs file from this repo in the `src` directory. Then you can compile and run the program with

`cargo run`

### Can't I just compile it with `rustc` directly?

Probably, but if you know how to do that, you know more about Rust than I do, and in that case I really should be the one asking the questions.

### Wait, but it's really slow... like, way slower than your paper says?

Yeah, you need to compile in release mode. Also if you don't have at least a couple of fast CPUs, it will be pretty slow anyway.

`cargo run --release`

## How much memory does this program use?

A lot. My machine (16GB, granted I have about 28 tabs open in Firefox) runs out after about seven and a half seconds.

## Is there a warranty or License?

The program is licensed under the MIT license.

Copyright 2017 William Temple

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
