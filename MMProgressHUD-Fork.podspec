Pod::Spec.new do |s|
  s.name         = "MMProgressHUD-Fork"
  s.version      = "0.2.3"
  s.summary      = "An easy to use HUD interface with personality."
  s.homepage     = "https://github.com/Yalantis/MMProgressHUD-Fork"
  s.license      = 'MIT'
  s.author       = { "Lars Anderson" => "lars.anderson@mutualmobile.com" }
  s.source       = {
     :git => "git@github.com:Yalantis/MMProgressHUD-Fork.git",
     :tag => '0.2.3'
  }
  s.platform     = :ios, '5.0'
  s.source_files = 'Source/*.{h,m}'
  s.public_header_files = 'Source/{MMProgressHUDOverlayView,MMProgressHUD,MMHud,MMProgressView-Protocol}.h'
  s.frameworks = 'QuartzCore', 'CoreGraphics'
  s.requires_arc = true
end
