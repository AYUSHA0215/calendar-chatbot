generator lang_python {
  language python
  // This is where your baml_client will be generated
  // Usually the root of your source code relative to this file
  project_root "../"
  // This command is used by "baml test" to run tests
  // defined in the playground
  test_command "python3 -m pytest"
  // This command is used by "baml update-client" to install
  // dependencies to your language environment
  install_command "pip install --upgrade baml"
  package_version_command "pip show baml"
}