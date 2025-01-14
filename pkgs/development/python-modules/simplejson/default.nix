{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "simplejson";
  version = "3.18.3";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-NKDcY/HRAbroT6onHdLP6oolEzWoCC+Jlf+Ec5bFDDc=";
  };

  nativeCheckInputs = [
    pytestCheckHook
  ];

  doCheck = !stdenv.isDarwin;

  pythonImportsCheck = [
    "simplejson"
  ];

  meta = with lib; {
    description = "Extensible JSON encoder/decoder for Python";
    longDescription = ''
      simplejson covers the full JSON specification for both encoding
      and decoding, with unicode support. By default, encoding is done
      in an encoding neutral fashion (plain ASCII with \uXXXX escapes
      for unicode characters).
    '';
    homepage = "https://github.com/simplejson/simplejson";
    changelog = "https://github.com/simplejson/simplejson/blob/v${version}/CHANGES.txt";
    license = with licenses; [ mit afl21 ];
    maintainers = with maintainers; [ fab ];
  };
}
