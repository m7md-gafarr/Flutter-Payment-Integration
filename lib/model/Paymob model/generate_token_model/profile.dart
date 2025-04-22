import 'bank_staffs.dart';
import 'user.dart';

class Profile {
  int? id;
  User? user;
  DateTime? createdAt;
  bool? active;
  String? profileType;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool? isMobadra;
  String? sector;
  bool? is2faEnabled;
  String? otpSentTo;
  int? activationMethod;
  int? signedUpThrough;
  int? failedAttempts;
  List<dynamic>? customExportColumns;
  List<dynamic>? serverIp;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  dynamic otp2faSentAt;
  dynamic otp2faAttempt;
  DateTime? otpSentAt;
  DateTime? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  int? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  int? bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;
  int? suspicious;
  dynamic latitude;
  dynamic longitude;
  BankStaffs? bankStaffs;
  dynamic bankRejectionReason;
  bool? bankReceivedDocuments;
  int? bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool? filledBusinessData;
  String? dayStartTime;
  dynamic dayEndTime;
  bool? withholdTransfers;
  bool? manualSettlement;
  String? smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool? canBillDepositWithCard;
  bool? canTopupMerchants;
  dynamic topupTransferId;
  bool? referralEligible;
  bool? isEligibleToBeRanger;
  bool? eligibleForManualRefunds;
  bool? isRanger;
  bool? isPoaching;
  bool? paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool? allowTransactionNotifications;
  bool? allowTransferNotifications;
  int? sallefnyAmountWhole;
  int? sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  bool? payoutEnabled;
  bool? payoutTerms;
  bool? isBillsNew;
  bool? canProcessMultipleRefunds;
  int? settlementClassification;
  bool? instantSettlementEnabled;
  bool? instantSettlementTransactionOtpVerified;
  dynamic preferredLanguage;
  bool? ignoreFlashCallbacks;
  bool? receiveCallbackCardInfo;
  dynamic acqPartner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Profile({
    this.id,
    this.user,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
    this.emailNotification,
    this.orderRetrievalEndpoint,
    this.deliveryUpdateEndpoint,
    this.logoUrl,
    this.isMobadra,
    this.sector,
    this.is2faEnabled,
    this.otpSentTo,
    this.activationMethod,
    this.signedUpThrough,
    this.failedAttempts,
    this.customExportColumns,
    this.serverIp,
    this.username,
    this.primaryPhoneNumber,
    this.primaryPhoneVerified,
    this.isTempPassword,
    this.otp2faSentAt,
    this.otp2faAttempt,
    this.otpSentAt,
    this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    this.deliveryStatusCallback,
    this.merchantExternalLink,
    this.merchantStatus,
    this.deactivatedByBank,
    this.bankDeactivationReason,
    this.bankMerchantStatus,
    this.nationalId,
    this.superAgent,
    this.walletLimitProfile,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    this.allowTerminalOrderId,
    this.allowEncryptionBypass,
    this.walletPhoneNumber,
    this.suspicious,
    this.latitude,
    this.longitude,
    this.bankStaffs,
    this.bankRejectionReason,
    this.bankReceivedDocuments,
    this.bankMerchantDigitalStatus,
    this.bankDigitalRejectionReason,
    this.filledBusinessData,
    this.dayStartTime,
    this.dayEndTime,
    this.withholdTransfers,
    this.manualSettlement,
    this.smsSenderName,
    this.withholdTransfersReason,
    this.withholdTransfersNotes,
    this.canBillDepositWithCard,
    this.canTopupMerchants,
    this.topupTransferId,
    this.referralEligible,
    this.isEligibleToBeRanger,
    this.eligibleForManualRefunds,
    this.isRanger,
    this.isPoaching,
    this.paymobAppMerchant,
    this.settlementFrequency,
    this.dayOfTheWeek,
    this.dayOfTheMonth,
    this.allowTransactionNotifications,
    this.allowTransferNotifications,
    this.sallefnyAmountWhole,
    this.sallefnyFeesWhole,
    this.paymobAppFirstLogin,
    this.paymobAppLastActivity,
    this.payoutEnabled,
    this.payoutTerms,
    this.isBillsNew,
    this.canProcessMultipleRefunds,
    this.settlementClassification,
    this.instantSettlementEnabled,
    this.instantSettlementTransactionOtpVerified,
    this.preferredLanguage,
    this.ignoreFlashCallbacks,
    this.receiveCallbackCardInfo,
    this.acqPartner,
    this.dom,
    this.bankRelated,
    this.permissions,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json['id'] as int?,
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    active: json['active'] as bool?,
    profileType: json['profile_type'] as String?,
    phones: json['phones'] as List<String>?,
    companyEmails: json['company_emails'] as List<String>?,
    companyName: json['company_name'] as String?,
    state: json['state'] as String?,
    country: json['country'] as String?,
    city: json['city'] as String?,
    postalCode: json['postal_code'] as String?,
    street: json['street'] as String?,
    emailNotification: json['email_notification'] as bool?,
    orderRetrievalEndpoint: json['order_retrieval_endpoint'] as dynamic,
    deliveryUpdateEndpoint: json['delivery_update_endpoint'] as dynamic,
    logoUrl: json['logo_url'] as dynamic,
    isMobadra: json['is_mobadra'] as bool?,
    sector: json['sector'] as String?,
    is2faEnabled: json['is_2fa_enabled'] as bool?,
    otpSentTo: json['otp_sent_to'] as String?,
    activationMethod: json['activation_method'] as int?,
    signedUpThrough: json['signed_up_through'] as int?,
    failedAttempts: json['failed_attempts'] as int?,
    customExportColumns: json['custom_export_columns'] as List<dynamic>?,
    serverIp: json['server_IP'] as List<dynamic>?,
    username: json['username'] as dynamic,
    primaryPhoneNumber: json['primary_phone_number'] as String?,
    primaryPhoneVerified: json['primary_phone_verified'] as bool?,
    isTempPassword: json['is_temp_password'] as bool?,
    otp2faSentAt: json['otp_2fa_sent_at'] as dynamic,
    otp2faAttempt: json['otp_2fa_attempt'] as dynamic,
    otpSentAt:
        json['otp_sent_at'] == null
            ? null
            : DateTime.parse(json['otp_sent_at'] as String),
    otpValidatedAt:
        json['otp_validated_at'] == null
            ? null
            : DateTime.parse(json['otp_validated_at'] as String),
    awbBanner: json['awb_banner'] as dynamic,
    emailBanner: json['email_banner'] as dynamic,
    identificationNumber: json['identification_number'] as dynamic,
    deliveryStatusCallback: json['delivery_status_callback'] as String?,
    merchantExternalLink: json['merchant_external_link'] as dynamic,
    merchantStatus: json['merchant_status'] as int?,
    deactivatedByBank: json['deactivated_by_bank'] as bool?,
    bankDeactivationReason: json['bank_deactivation_reason'] as dynamic,
    bankMerchantStatus: json['bank_merchant_status'] as int?,
    nationalId: json['national_id'] as dynamic,
    superAgent: json['super_agent'] as dynamic,
    walletLimitProfile: json['wallet_limit_profile'] as dynamic,
    address: json['address'] as dynamic,
    commercialRegistration: json['commercial_registration'] as dynamic,
    commercialRegistrationArea: json['commercial_registration_area'] as dynamic,
    distributorCode: json['distributor_code'] as dynamic,
    distributorBranchCode: json['distributor_branch_code'] as dynamic,
    allowTerminalOrderId: json['allow_terminal_order_id'] as bool?,
    allowEncryptionBypass: json['allow_encryption_bypass'] as bool?,
    walletPhoneNumber: json['wallet_phone_number'] as dynamic,
    suspicious: json['suspicious'] as int?,
    latitude: json['latitude'] as dynamic,
    longitude: json['longitude'] as dynamic,
    bankStaffs:
        json['bank_staffs'] == null
            ? null
            : BankStaffs.fromJson(json['bank_staffs'] as Map<String, dynamic>),
    bankRejectionReason: json['bank_rejection_reason'] as dynamic,
    bankReceivedDocuments: json['bank_received_documents'] as bool?,
    bankMerchantDigitalStatus: json['bank_merchant_digital_status'] as int?,
    bankDigitalRejectionReason:
        json['bank_digital_rejection_reason'] as dynamic,
    filledBusinessData: json['filled_business_data'] as bool?,
    dayStartTime: json['day_start_time'] as String?,
    dayEndTime: json['day_end_time'] as dynamic,
    withholdTransfers: json['withhold_transfers'] as bool?,
    manualSettlement: json['manual_settlement'] as bool?,
    smsSenderName: json['sms_sender_name'] as String?,
    withholdTransfersReason: json['withhold_transfers_reason'] as dynamic,
    withholdTransfersNotes: json['withhold_transfers_notes'] as dynamic,
    canBillDepositWithCard: json['can_bill_deposit_with_card'] as bool?,
    canTopupMerchants: json['can_topup_merchants'] as bool?,
    topupTransferId: json['topup_transfer_id'] as dynamic,
    referralEligible: json['referral_eligible'] as bool?,
    isEligibleToBeRanger: json['is_eligible_to_be_ranger'] as bool?,
    eligibleForManualRefunds: json['eligible_for_manual_refunds'] as bool?,
    isRanger: json['is_ranger'] as bool?,
    isPoaching: json['is_poaching'] as bool?,
    paymobAppMerchant: json['paymob_app_merchant'] as bool?,
    settlementFrequency: json['settlement_frequency'] as dynamic,
    dayOfTheWeek: json['day_of_the_week'] as dynamic,
    dayOfTheMonth: json['day_of_the_month'] as dynamic,
    allowTransactionNotifications:
        json['allow_transaction_notifications'] as bool?,
    allowTransferNotifications: json['allow_transfer_notifications'] as bool?,
    sallefnyAmountWhole: json['sallefny_amount_whole'] as int?,
    sallefnyFeesWhole: json['sallefny_fees_whole'] as int?,
    paymobAppFirstLogin: json['paymob_app_first_login'] as dynamic,
    paymobAppLastActivity: json['paymob_app_last_activity'] as dynamic,
    payoutEnabled: json['payout_enabled'] as bool?,
    payoutTerms: json['payout_terms'] as bool?,
    isBillsNew: json['is_bills_new'] as bool?,
    canProcessMultipleRefunds: json['can_process_multiple_refunds'] as bool?,
    settlementClassification: json['settlement_classification'] as int?,
    instantSettlementEnabled: json['instant_settlement_enabled'] as bool?,
    instantSettlementTransactionOtpVerified:
        json['instant_settlement_transaction_otp_verified'] as bool?,
    preferredLanguage: json['preferred_language'] as dynamic,
    ignoreFlashCallbacks: json['ignore_flash_callbacks'] as bool?,
    receiveCallbackCardInfo: json['receive_callback_card_info'] as bool?,
    acqPartner: json['acq_partner'] as dynamic,
    dom: json['dom'] as dynamic,
    bankRelated: json['bank_related'] as dynamic,
    permissions: json['permissions'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'created_at': createdAt?.toIso8601String(),
    'active': active,
    'profile_type': profileType,
    'phones': phones,
    'company_emails': companyEmails,
    'company_name': companyName,
    'state': state,
    'country': country,
    'city': city,
    'postal_code': postalCode,
    'street': street,
    'email_notification': emailNotification,
    'order_retrieval_endpoint': orderRetrievalEndpoint,
    'delivery_update_endpoint': deliveryUpdateEndpoint,
    'logo_url': logoUrl,
    'is_mobadra': isMobadra,
    'sector': sector,
    'is_2fa_enabled': is2faEnabled,
    'otp_sent_to': otpSentTo,
    'activation_method': activationMethod,
    'signed_up_through': signedUpThrough,
    'failed_attempts': failedAttempts,
    'custom_export_columns': customExportColumns,
    'server_IP': serverIp,
    'username': username,
    'primary_phone_number': primaryPhoneNumber,
    'primary_phone_verified': primaryPhoneVerified,
    'is_temp_password': isTempPassword,
    'otp_2fa_sent_at': otp2faSentAt,
    'otp_2fa_attempt': otp2faAttempt,
    'otp_sent_at': otpSentAt?.toIso8601String(),
    'otp_validated_at': otpValidatedAt?.toIso8601String(),
    'awb_banner': awbBanner,
    'email_banner': emailBanner,
    'identification_number': identificationNumber,
    'delivery_status_callback': deliveryStatusCallback,
    'merchant_external_link': merchantExternalLink,
    'merchant_status': merchantStatus,
    'deactivated_by_bank': deactivatedByBank,
    'bank_deactivation_reason': bankDeactivationReason,
    'bank_merchant_status': bankMerchantStatus,
    'national_id': nationalId,
    'super_agent': superAgent,
    'wallet_limit_profile': walletLimitProfile,
    'address': address,
    'commercial_registration': commercialRegistration,
    'commercial_registration_area': commercialRegistrationArea,
    'distributor_code': distributorCode,
    'distributor_branch_code': distributorBranchCode,
    'allow_terminal_order_id': allowTerminalOrderId,
    'allow_encryption_bypass': allowEncryptionBypass,
    'wallet_phone_number': walletPhoneNumber,
    'suspicious': suspicious,
    'latitude': latitude,
    'longitude': longitude,
    'bank_staffs': bankStaffs?.toJson(),
    'bank_rejection_reason': bankRejectionReason,
    'bank_received_documents': bankReceivedDocuments,
    'bank_merchant_digital_status': bankMerchantDigitalStatus,
    'bank_digital_rejection_reason': bankDigitalRejectionReason,
    'filled_business_data': filledBusinessData,
    'day_start_time': dayStartTime,
    'day_end_time': dayEndTime,
    'withhold_transfers': withholdTransfers,
    'manual_settlement': manualSettlement,
    'sms_sender_name': smsSenderName,
    'withhold_transfers_reason': withholdTransfersReason,
    'withhold_transfers_notes': withholdTransfersNotes,
    'can_bill_deposit_with_card': canBillDepositWithCard,
    'can_topup_merchants': canTopupMerchants,
    'topup_transfer_id': topupTransferId,
    'referral_eligible': referralEligible,
    'is_eligible_to_be_ranger': isEligibleToBeRanger,
    'eligible_for_manual_refunds': eligibleForManualRefunds,
    'is_ranger': isRanger,
    'is_poaching': isPoaching,
    'paymob_app_merchant': paymobAppMerchant,
    'settlement_frequency': settlementFrequency,
    'day_of_the_week': dayOfTheWeek,
    'day_of_the_month': dayOfTheMonth,
    'allow_transaction_notifications': allowTransactionNotifications,
    'allow_transfer_notifications': allowTransferNotifications,
    'sallefny_amount_whole': sallefnyAmountWhole,
    'sallefny_fees_whole': sallefnyFeesWhole,
    'paymob_app_first_login': paymobAppFirstLogin,
    'paymob_app_last_activity': paymobAppLastActivity,
    'payout_enabled': payoutEnabled,
    'payout_terms': payoutTerms,
    'is_bills_new': isBillsNew,
    'can_process_multiple_refunds': canProcessMultipleRefunds,
    'settlement_classification': settlementClassification,
    'instant_settlement_enabled': instantSettlementEnabled,
    'instant_settlement_transaction_otp_verified':
        instantSettlementTransactionOtpVerified,
    'preferred_language': preferredLanguage,
    'ignore_flash_callbacks': ignoreFlashCallbacks,
    'receive_callback_card_info': receiveCallbackCardInfo,
    'acq_partner': acqPartner,
    'dom': dom,
    'bank_related': bankRelated,
    'permissions': permissions,
  };
}
