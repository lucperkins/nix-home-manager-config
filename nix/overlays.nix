{ hugo }:

let
  hugoOverlay = (self: super: {
    hugo = super.hugo.overrideAttrs (_: {
      version = hugo.version;

      src = super.fetchFromGitHub {
        owner = "gohugoio";
        repo = "hugo";
        sha256 = hugo.sha256;
        rev = "v${hugo.version}";
      };

      vendorSha256 = hugo.vendorSha256;
    });
  });
in
[
  #hugoOverlay
]
