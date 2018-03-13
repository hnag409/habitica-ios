// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum Main: StoryboardType {
    static let storyboardName = "Main"

    static let aboutViewController = SceneType<HRPGAboutViewController>(storyboard: Main.self, identifier: "AboutViewController")

    static let faqOverviewViewController = SceneType<Habitica.FAQTableViewController>(storyboard: Main.self, identifier: "FAQOverviewViewController")

    static let gemPurchaseViewController = SceneType<Habitica.GemViewController>(storyboard: Main.self, identifier: "GemPurchaseViewController")

    static let itemNavigationController = SceneType<UINavigationController>(storyboard: Main.self, identifier: "ItemNavigationController")

    static let mainTabBarController = SceneType<HRPGTabBarController>(storyboard: Main.self, identifier: "MainTabBarController")

    static let purchaseGemNavController = SceneType<HRPGGemHeaderNavigationController>(storyboard: Main.self, identifier: "PurchaseGemNavController")

    static let scanQRCodeNavController = SceneType<UINavigationController>(storyboard: Main.self, identifier: "ScanQRCodeNavController")

    static let selectClassNavigationController = SceneType<UINavigationController>(storyboard: Main.self, identifier: "SelectClassNavigationController")

    static let spellUserNavigationController = SceneType<UINavigationController>(storyboard: Main.self, identifier: "SpellUserNavigationController")

    static let subscriptionViewController = SceneType<Habitica.SubscriptionViewController>(storyboard: Main.self, identifier: "SubscriptionViewController")

    static let spellTaskNavigationController = SceneType<UINavigationController>(storyboard: Main.self, identifier: "spellTaskNavigationController")

    static let tagNavigationController = SceneType<HRPGNavigationController>(storyboard: Main.self, identifier: "tagNavigationController")
  }
  enum Social: StoryboardType {
    static let storyboardName = "Social"

    static let challengeNavigationViewController = SceneType<UINavigationController>(storyboard: Social.self, identifier: "ChallengeNavigationViewController")

    static let challengeTableViewController = SceneType<Habitica.ChallengeTableViewController>(storyboard: Social.self, identifier: "ChallengeTableViewController")

    static let groupDetailTableViewController = SceneType<HRPGGroupTableViewController>(storyboard: Social.self, identifier: "GroupDetailTableViewController")

    static let groupTableViewController = SceneType<Habitica.SplitSocialViewController>(storyboard: Social.self, identifier: "GroupTableViewController")

    static let guildsOverviewViewController = SceneType<HRPGGuildsOverviewViewController>(storyboard: Social.self, identifier: "GuildsOverviewViewController")

    static let inboxChatViewController = SceneType<HRPGInboxChatViewController>(storyboard: Social.self, identifier: "InboxChatViewController")

    static let inboxNavigationViewController = SceneType<UINavigationController>(storyboard: Social.self, identifier: "InboxNavigationViewController")

    static let inboxViewController = SceneType<HRPGInboxTableViewController>(storyboard: Social.self, identifier: "InboxViewController")

    static let messageViewController = SceneType<HRPGNavigationController>(storyboard: Social.self, identifier: "MessageViewController")

    static let partyDetailViewController = SceneType<HRPGPartyTableViewController>(storyboard: Social.self, identifier: "PartyDetailViewController")

    static let partyNavigationViewController = SceneType<UINavigationController>(storyboard: Social.self, identifier: "PartyNavigationViewController")

    static let partyViewController = SceneType<Habitica.PartyViewController>(storyboard: Social.self, identifier: "PartyViewController")

    static let questDetailViewController = SceneType<HRPGQuestDetailViewController>(storyboard: Social.self, identifier: "QuestDetailViewController")

    static let tavernChatViewController = SceneType<Habitica.GroupChatViewController>(storyboard: Social.self, identifier: "TavernChatViewController")

    static let tavernNavigationViewController = SceneType<UINavigationController>(storyboard: Social.self, identifier: "TavernNavigationViewController")

    static let tavernViewController = SceneType<Habitica.TavernViewController>(storyboard: Social.self, identifier: "TavernViewController")

    static let userProfileViewController = SceneType<HRPGUserProfileViewController>(storyboard: Social.self, identifier: "UserProfileViewController")

    static let questInvitationNavigationController = SceneType<HRPGNavigationController>(storyboard: Social.self, identifier: "questInvitationNavigationController")
  }
}

enum StoryboardSegue {
  enum Main: String, SegueType {
    case aboutSegue = "AboutSegue"
    case castUserSpellSegue = "CastUserSpellSegue"
    case customizationSegue = "CustomizationSegue"
    case detailSegue = "DetailSegue"
    case equipmentDetailSegue = "EquipmentDetailSegue"
    case equipmentSegue = "EquipmentSegue"
    case faqDetailSegue = "FAQDetailSegue"
    case faqSegue = "FAQSegue"
    case feedSegue = "FeedSegue"
    case filterSegue = "FilterSegue"
    case formSegue = "FormSegue"
    case groupBySegue = "GroupBySegue"
    case helpSegue = "HelpSegue"
    case itemSegue = "ItemSegue"
    case mountSegue = "MountSegue"
    case newsSegue = "NewsSegue"
    case petSegue = "PetSegue"
    case scannedCodeSegue = "ScannedCodeSegue"
    case selectClassSegue = "SelectClassSegue"
    case settingsSegue = "SettingsSegue"
    case shopsSegue = "ShopsSegue"
    case showShopSegue = "ShowShopSegue"
    case unwindTagSegue = "UnwindTagSegue"
    case unwindSaveSegue
    case unwindSegue
  }
  enum Social: String, SegueType {
    case aboutSegue = "AboutSegue"
    case challengeSegue = "ChallengeSegue"
    case chatSegue = "ChatSegue"
    case groupFormSegue = "GroupFormSegue"
    case guidelinesSegue = "GuidelinesSegue"
    case invitationSegue = "InvitationSegue"
    case membersSegue = "MembersSegue"
    case messageSegue = "MessageSegue"
    case participantsSegue = "ParticipantsSegue"
    case questDetailSegue = "QuestDetailSegue"
    case selectedRecipientSegue = "SelectedRecipientSegue"
    case showGuildSegue = "ShowGuildSegue"
    case userProfileSegue = "UserProfileSegue"
    case writeMessageSegue = "WriteMessageSegue"
    case challengeDetailsSegue
    case unwindSaveSegue
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}