import Carbon
import Foundation

extension TISInputSource {
  /// - Returns: True if this input source is a valid candidate for selection
  var isValidCandidate: Bool {
    let isSelectable = getProperty(kTISPropertyInputSourceIsSelectCapable) as! Bool
    let isInputSource = category == kTISCategoryKeyboardInputSource as String
    return isSelectable && isInputSource
  }

  private func getProperty(_ key: CFString) -> AnyObject? {
    return TISGetInputSourceProperty(self, key)?.get()
  }
    
  /**
   * Potentially useful properties:
   * 1. kTISPropertyInputSourceID
   * 2. kTISPropertyLocalizedName
   * 3. kTISPropertyInputSourceCategory
   * 4. kTISPropertyInputSourceIsSelectCapable
   */
  
  /// English name for this input source
  var name: String {
    return getProperty(kTISPropertyLocalizedName) as! String
  }
  
  
  /// Valid values:
  /// 1. TISCategoryKeyboardInputSource
  /// 2. TISCategoryPaletteInputSource whose .name is
  ///    i.  Japanese Kana Palette
  ///    ro. com.apple.PressAndHold
  ///    ha. Emoji & Symbols
  ///    ni. Keyboard Viewer
  ///    ho. Trackpad Handwriting
  ///    he. EmojiFunctionRowIM_Extension
  var category: String {
    return getProperty(kTISPropertyInputSourceCategory) as! String
  }
}

private extension UnsafeMutableRawPointer {
  func get() -> AnyObject? {
    return Unmanaged<AnyObject>.fromOpaque(self).takeUnretainedValue()
  }
}
