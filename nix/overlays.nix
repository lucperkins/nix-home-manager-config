{ hugo }:

let
  hugoOverlay = (self: super: {
    hugo = super.hugo.overrideAttrs (old: {
      version = hugo.version;

      src = super.fetchFromGitHub {
        owner = "gohugoio";
        repo = "hugo";
        sha256 = hugo.sha256;
        rev = "v${hugo.version}";
      };
      proxyVendor = false;
    });
  });
in
[
  #hugoOverlay doesn't work for some reason
]