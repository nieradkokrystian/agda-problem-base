# agda-problem-base

This repository contains problems to be solved by LLM (Language Model). It is used by the agda-gpt-experiment tool as a problem database.

All problems are located in the "Problems" directory or its subdirectories. Each problem can have its own metadata, including the Agda compiler version and dependencies.

The metadata file for a given problem should have the same name as the problem, with the .json extension, and be located in the same directory as the problem. If a problem does not have individually defined metadata, the general metadata from the Meta.json file will be used. This file can be located in the same directory or in directories above. The file closest to the problem file will be used.

Folder and file names begin with a capital letter. The repository includes the "ExampleProblem" directory, which contains several sample problems.

For more information, please contact Krystian Nieradko at krystian.nieradko@gmail.com.
