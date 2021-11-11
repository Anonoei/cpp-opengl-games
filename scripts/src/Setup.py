import os
import subprocess
import platform

from SetupPython import PythonConfiguration as PythonRequirements

# Make sure everything we need for the setup is installed
PythonRequirements.Validate()

from SetupPremake import PremakeConfiguration as PremakeRequirements

os.chdir('./../..') # Change from root/scripts/src directory to root

premakeInstalled = PremakeRequirements.Validate()

print("\nUpdating submodules...")
subprocess.call(["git", "submodule", "update", "--init", "--recursive", "--remote"])

if (premakeInstalled):
    if platform.system() == "Windows":
        print("\nRunning premake...")
        subprocess.call([os.path.abspath("./scripts/src/Windows-GenProjects.bat"), "nopause"])

    print("\nSetup completed <premake>!")
else:
    print("DAGGer requires Premake to generate project files.")

print("\nSetup completed <done>!")