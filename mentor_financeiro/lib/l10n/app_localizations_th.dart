// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ที่ปรึกษาการเงิน';

  @override
  String get saldo => 'Z ยอดคงเหลือ';

  @override
  String get gastosDiarios => 'ค่าใช้จ่ายรายวัน';

  @override
  String get confirmarTransacao => 'ยืนยันการทำธุรกรรม\nแถลงการณ์';

  @override
  String get extrato => '';

  @override
  String get transferencias => 'การโอน';

  @override
  String get investimentos => 'การลงทุน\nการตั้งค่า';

  @override
  String get configuracoes => '';

  @override
  String get perfil => 'โปรไฟล์';

  @override
  String get sair => 'ออกจากระบบ';

  @override
  String get entrar => 'เข้าสู่ระบบ';

  @override
  String get cadastrar => 'ลงทะเบียน';

  @override
  String get email => 'อีเมล์';

  @override
  String get senha => 'รหัสผ่าน';

  @override
  String get nome => 'ชื่อ';

  @override
  String get cpf => 'หมายเลขประจำตัว';

  @override
  String get telefone => 'โทรศัพท์';

  @override
  String get continuar => 'ดำเนินการต่อ';

  @override
  String get voltar => 'กลับ';

  @override
  String get cancelar => 'ยกเลิก';

  @override
  String get salvar => 'บันทึก';

  @override
  String get editar => 'แก้ไข';

  @override
  String get excluir => 'ลบ';

  @override
  String get sucesso => 'สำเร็จ';

  @override
  String get erro => 'ผิดพลาด';

  @override
  String get carregando => 'กำลังโหลด...';

  @override
  String get semDados => 'ไม่มีข้อมูล';

  @override
  String get tentarNovamente => 'ลองอีกครั้ง\nรายงาน';

  @override
  String get relatorios => '';

  @override
  String get gastosPorCategoria => 'ค่าใช้จ่ายตามหมวดหมู่';

  @override
  String get ultimosSeteDias => '7 วันที่ผ่านมา';

  @override
  String get totalGasto => 'การใช้จ่ายทั้งหมด\nธุรกรรม';

  @override
  String get transacoes => '';

  @override
  String get categoria => 'หมวดหมู่';

  @override
  String get data => 'วันที่';

  @override
  String get valor => 'ค่า';

  @override
  String get descricao => 'คำอธิบาย';

  @override
  String get alimentacao => 'อาหาร';

  @override
  String get transporte => 'ขนส่ง';

  @override
  String get lazer => 'สันทนาการ';

  @override
  String get saude => 'สุขภาพ';

  @override
  String get outros => 'อื่นๆ';

  @override
  String get notificacoes => 'การแจ้งเตือน';

  @override
  String get permissaoNotificacoes => 'การอนุญาตการแจ้งเตือน';

  @override
  String get ativarMonitoramento => 'เปิดใช้งานการตรวจสอบค่าใช้จ่าย';

  @override
  String get descricaoMonitoramento =>
      'อนุญาตให้แอปตรวจสอบธุรกรรมธนาคารของคุณโดยอัตโนมัติเพื่อจัดระเบียบการเงินของคุณ';

  @override
  String get idioma => 'ภาษา';

  @override
  String get moeda => 'สกุลเงิน';

  @override
  String get compararInvestimentos => 'เปรียบเทียบการลงทุน';

  @override
  String get descricaoLocalizacao =>
      'เพื่อเปรียบเทียบการลงทุนในท้องถิ่น (CDB/CDI) กับอัตราต่างประเทศ เราต้องการที่ตั้งของคุณ';

  @override
  String get permissaoLocalizacaoNecessaria => 'ต้องได้รับอนุญาตจากตำแหน่ง';

  @override
  String get rendaFixa => 'ตราสารหนี้';

  @override
  String get rendaVariavel => 'รายได้ผันแปร';

  @override
  String get tesouroDireto => 'กระทรวงการคลังโดยตรง';

  @override
  String get cdb => 'ซีบีดี';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'แอลซีเอ';

  @override
  String get acoes => 'หุ้น';

  @override
  String get fiis => 'FII';

  @override
  String get criptomoedas => 'สกุลเงินดิจิทัล';

  @override
  String get rendimento => 'กลับมา';

  @override
  String get rentabilidade => 'การทำกำไร';

  @override
  String get aplicar => 'สมัครเลย';

  @override
  String get resgatar => 'แลกเลย';

  @override
  String get simular => 'จำลอง';

  @override
  String get metas => 'เป้าหมาย';

  @override
  String get estrategias => 'กลยุทธ์';

  @override
  String get conhecimento => 'เกร็ดความรู้';

  @override
  String get chat => 'แชท.';

  @override
  String get enviarMensagem => 'ส่งข้อความ';

  @override
  String get digiteMensagem => 'พิมพ์ข้อความ...';

  @override
  String get alertaGastos => 'การแจ้งเตือนการใช้จ่าย';

  @override
  String alertaGastosMsg(int percent) {
    return 'คุณใช้ไปแล้ว $percent% ของวงเงินเครดิตของคุณ';
  }

  @override
  String get fechamentoFatura => 'การปิดใบแจ้งหนี้';

  @override
  String get fechamentoFaturaMsg =>
      'พรุ่งนี้เป็นวันปิดทำการครับ ช่วงเวลาที่ดีในการทบทวนค่าใช้จ่าย';

  @override
  String get faturaVencendo => 'ครบกำหนดชำระใบแจ้งหนี้';

  @override
  String faturaVencendoMsg(int dias) {
    return 'ใบแจ้งหนี้ถึงกำหนดชำระใน $dias วัน ตรวจสอบยอดเงินของคุณ';
  }

  @override
  String get regra30 => 'Z เคล็ดลับ: กฎ 30%';

  @override
  String get regra30Msg =>
      'รักษาการใช้งานต่ำกว่า 30% เพื่อปรับปรุงคะแนนเครดิตของคุณ';

  @override
  String get diaDeOuro => 'วันทอง!';

  @override
  String get diaDeOuroMsg =>
      'การซื้อของคุณวันนี้จะได้รับการชำระเงินใน 40 วันเท่านั้น!';

  @override
  String get alertaJuros => 'Z คำเตือน: ดอกเบี้ย';

  @override
  String get alertaJurosMsg =>
      'ยอดคงเหลือของคุณไม่ครอบคลุมบิล หลีกเลี่ยงการหมุนเวียนเครดิต!';

  @override
  String get notaSaude => 'สุขภาพการเงิน';

  @override
  String get notaExcelente => 'เยี่ยมมาก! คุณมีสุขภาพทางการเงินที่ดี';

  @override
  String get notaBom => 'ดีแต่ปรับปรุงได้';

  @override
  String get notaAtencao => 'ใส่ใจในการใช้จ่าย';

  @override
  String get notaRevisar => 'ตรวจสอบการเงินของคุณ';

  @override
  String get mentorInsightTitle => 'คำแนะนำพี่เลี้ยง';

  @override
  String get mentorInsightLoading => 'กำลังดึงข้อมูลตลาด...';

  @override
  String get mentorInsightError =>
      'ไม่สามารถโหลดข้อมูลได้ในขณะนี้ โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get mentorInsightOffline =>
      'คุณออฟไลน์อยู่ เชื่อมต่อเพื่อรับคำพูดและข้อมูลเชิงลึกของที่ปรึกษา';

  @override
  String get mentorAllocationDefensive =>
      'ด้วยความผันผวนในปัจจุบัน ควรจัดลำดับความสำคัญของการรักษาเงินทุนและสภาพคล่องก่อนไล่ล่าผลตอบแทน';

  @override
  String get mentorAllocationBalanced =>
      'การป้องกันและการเติบโตที่สมดุล: กระจายความเสี่ยงและทบทวนขอบเขตเป้าหมายของคุณอีกครั้ง';

  @override
  String get mentorAllocationOffensive =>
      'โปรไฟล์ของคุณมีความเสี่ยงมากขึ้น: รักษาวินัยและหลีกเลี่ยงการมีสมาธิมากเกินไป';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'ตรวจสอบสัญลักษณ์แล้ว: $symbols';
  }

  @override
  String get currencyFollowLocale => 'อัตโนมัติ (ภาษา)';

  @override
  String get compoundCalculatorTitle => 'Mentor Calculator — ดอกเบี้ยทบต้น';

  @override
  String get compoundCalculatorSubtitle =>
      'จำลองการมีส่วนร่วม กำไรเล็กน้อยเทียบกับกำไรจริง (หลังอัตราเงินเฟ้อ) และบันทึกที่ปรึกษา';

  @override
  String get compoundInitialLabel => 'เงินก้อนเริ่มต้น';

  @override
  String get compoundMonthlyLabel => 'บริจาครายเดือน';

  @override
  String get compoundRateLabel => 'อัตราดอกเบี้ย';

  @override
  String get compoundRateAnnual => 'ต่อปี';

  @override
  String get compoundRateMonthly => 'ต่อเดือน';

  @override
  String get compoundHorizonLabel => 'ขอบฟ้าเวลา';

  @override
  String get compoundHorizonYears => 'ปี';

  @override
  String get compoundHorizonMonths => 'เดือน';

  @override
  String get compoundInflationLabel => 'ประมาณการอัตราเงินเฟ้อ (% ต่อปี)';

  @override
  String get compoundCalculate => 'คำนวณ';

  @override
  String get compoundChartInvested => 'รวมเงินลงทุน';

  @override
  String get compoundChartInterest => 'ดอกเบี้ยที่ได้รับ';

  @override
  String get compoundSummaryNominalEnd => 'ยอดคงเหลือสิ้นสุด (ระบุ)';

  @override
  String get compoundSummaryRealGain => 'กำไรจริง (กำลังซื้อ)';

  @override
  String get compoundMentorCardTitle => 'คำแนะนำพี่เลี้ยง';

  @override
  String get compoundInvalidInput => 'ป้อนค่าที่ถูกต้อง (ขอบฟ้า > 0)';

  @override
  String get userPersonaSectionTitle => 'โทนเนอร์พี่เลี้ยง';

  @override
  String get userPersonaNovice => 'มือใหม่';

  @override
  String get userPersonaStrategist => 'นักยุทธศาสตร์';

  @override
  String get userPersonaRiskTaker => 'คนรับความเสี่ยง';

  @override
  String get userPersonaConservative => 'เซฟเวอร์';

  @override
  String get compoundOpenFullInsight => 'เปิดข้อมูลเชิงลึกที่ปรึกษาแบบเต็ม';

  @override
  String get investFirstSteps_title => 'ก้าวแรก';

  @override
  String get investFirstSteps_brokerTitle => 'เลือกโบรกเกอร์';

  @override
  String get investFirstSteps_brokerBody =>
      'มองหาสถาบันที่ได้รับการควบคุมและมีชื่อเสียง เปรียบเทียบค่าธรรมเนียม ผลิตภัณฑ์ และความน่าเชื่อถือก่อนเปิดบัญชี';

  @override
  String get investFirstSteps_openAccountTitle => 'เปิดบัญชีของคุณ';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'การเริ่มต้นระบบดิจิทัล ในบราซิล โดยทั่วไปคุณจะต้องมี CPF/RG และบางครั้งก็ต้องมีหลักฐานแสดงที่อยู่';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'การเริ่มใช้งานระบบดิจิทัลจะแตกต่างกันไปในแต่ละประเทศ โดยปกติแล้ว คุณจะต้องมีเอกสารประจำตัวและการยืนยันตัวตน/ที่อยู่';

  @override
  String get investFirstSteps_transferTitle => 'โอนเงิน';

  @override
  String get investFirstSteps_transferBodyBr =>
      'ส่งเงินผ่าน PIX หรือโอนเงินผ่านธนาคารไปยังนายหน้าของคุณ ยอดคงเหลือก็พร้อมลงทุน';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'โอนเงินผ่านการโอนเงินผ่านธนาคารหรือวิธีการชำระเงินในท้องถิ่น (ขึ้นอยู่กับประเทศของคุณ) ยอดคงเหลือก็พร้อมลงทุน';

  @override
  String get investFirstSteps_riskProfileTitle => 'ทราบโปรไฟล์ความเสี่ยงของคุณ';

  @override
  String get investFirstSteps_riskProfileBody =>
      'ตอบแบบสอบถามความเหมาะสม เข้าใจว่าคุณเป็นคนอนุรักษ์นิยม ปานกลาง หรือก้าวร้าว';

  @override
  String get investFirstSteps_firstAssetTitle => 'ซื้อสินทรัพย์แรกของคุณ';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'เริ่มต้นด้วยกองทุนฉุกเฉิน (Tesouro Selic หรือ CDB สภาพคล่องรายวัน) แล้วค่อยๆกระจายออกไป';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'เริ่มต้นด้วยกองทุนฉุกเฉิน (เงินสดที่ให้ผลตอบแทนสูง กองทุนตลาดเงิน หรือพันธบัตรรัฐบาลระยะสั้น) แล้วค่อยๆกระจายออกไป\nเคล็ดลับที่ปรึกษา';

  @override
  String get investFirstSteps_tipTitle => ':';

  @override
  String get investFirstSteps_tipBodyBr =>
      'เริ่มต้นเล็กๆ ลงทุนอย่างสม่ำเสมอ และหลีกเลี่ยงการพยายามจับเวลาตลาด เวลาเป็นพันธมิตรที่ดีที่สุดของคุณ';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Z เริ่มต้นเล็กๆ ลงทุนอย่างสม่ำเสมอ และหลีกเลี่ยงการพยายามจับเวลาตลาด เวลาเป็นพันธมิตรที่ดีที่สุดของคุณ';

  @override
  String get investMenu_tesouroTitle => 'คลังบราซิล';

  @override
  String get investMenu_cdbTitle => 'ตราสารหนี้ธนาคาร (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETF ระหว่างประเทศ';

  @override
  String get investMenu_sp500Title => 'S&P 500 (ดัชนี)';

  @override
  String get investMenu_stocksTitle => 'หุ้น\nกองทุน';

  @override
  String get investMenu_fundsTitle => '';

  @override
  String get investMenu_fiisTitle => 'FII';

  @override
  String get investMenu_reitsTitle => 'กอง REIT';

  @override
  String get investMenu_internationalTitle => 'อินเตอร์เนชั่นแนล';

  @override
  String get investMenu_cryptoTitle => 'คริปโต';

  @override
  String get investRegisterCta => 'ลงทะเบียนการลงทุน';

  @override
  String investRegionHintBr(String country) {
    return 'ประเทศที่มีผลบังคับใช้: $country · แค็ตตาล็อกบราซิล (คลัง, CDB, LCA…)';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'ประเทศที่มีผลบังคับใช้: $country · แค็ตตาล็อกทั่วโลก (ETFs, NYSE/NASDAQ…) ปรับโดยอัตโนมัติจากภูมิภาคอุปกรณ์ของคุณ';
  }

  @override
  String get strategy_sectionCoreTitle => 'Essential strategies';

  @override
  String get strategy_sectionDeepDiveTitle => 'ดำน้ำลึก (พรีเมียม)';

  @override
  String get strategy_emergencyFundTitle => 'กองทุนฉุกเฉิน';

  @override
  String get strategy_emergencyFundBodyBr =>
      'เกราะป้องกันทางการเงินของคุณ ครอบคลุมค่าใช้จ่าย 6-12 เดือน จัดลำดับความสำคัญของสภาพคล่องรายวันและความเสี่ยงต่ำ (เช่น Tesouro Selic หรือ CDB ที่เชื่อมโยงกับ CDI)';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'เกราะป้องกันทางการเงินของคุณ ครอบคลุมค่าใช้จ่าย 6-12 เดือน จัดลำดับความสำคัญของสภาพคล่องรายวันและความเสี่ยงต่ำ (เช่น กองทุนตลาดเงินและพันธบัตรรัฐบาลระยะสั้น)';

  @override
  String get strategy_buyHoldTitle => 'ซื้อและถือ';

  @override
  String get strategy_buyHoldBody =>
      'ซื้อสินทรัพย์คุณภาพและถือระยะยาว มุ่งเน้นไปที่ระเบียบวินัย คุณภาพ และการลงทุนซ้ำเมื่อเวลาผ่านไป';

  @override
  String get strategy_diversificationTitle => 'Z การกระจายความเสี่ยง';

  @override
  String get strategy_diversificationBodyBr =>
      'กระจายเงินทุนของคุณไปยังตราสารหนี้ หุ้น FII และสินทรัพย์ระหว่างประเทศเพื่อลดความเสี่ยงและปรับปรุงผลตอบแทนที่ปรับตามความเสี่ยง';

  @override
  String get strategy_diversificationBodyGlobal =>
      'กระจายเงินทุนของคุณไปยังพันธบัตร หุ้น REIT และการลงทุนในต่างประเทศ เพื่อลดความเสี่ยงและปรับปรุงผลตอบแทนที่ปรับตามความเสี่ยง';

  @override
  String get strategy_dcaTitle => 'ค่าเฉลี่ยต้นทุนดอลลาร์ (DCA)';

  @override
  String get strategy_dcaBody =>
      'ความสม่ำเสมอเอาชนะอัจฉริยะ การลงทุนทุกเดือนมักจะมีประสิทธิภาพมากกว่าการพยายามเลือกจุดเริ่มต้นที่สมบูรณ์แบบ';

  @override
  String get strategy_smartGoalsTitle => 'เป้าหมายที่ชาญฉลาด';

  @override
  String get strategy_smartGoalsBody =>
      'เป้าหมายของคุณควรเฉพาะเจาะจง วัดผลได้ บรรลุผลได้ เกี่ยวข้อง และมีกำหนดเวลา';

  @override
  String get strategy_503020Title => 'กฎ 50-30-20';

  @override
  String get strategy_503020Body =>
      'กรอบการจัดทำงบประมาณอย่างง่าย: ความต้องการ 50%, ความต้องการ 30%, การลงทุนและเป้าหมาย 20%';

  @override
  String get strategy_deepDive_allocationTitle =>
      'การจัดสรรสินทรัพย์ (ขั้นสูง)';

  @override
  String get strategy_deepDive_allocationBody =>
      'เรียนรู้วิธีสร้างการจัดสรรตามเป้าหมายและขอบฟ้า การปรับความเสี่ยง ความสัมพันธ์ และการปรับสมดุล';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'Global ETFs และดัชนี (ขั้นสูง)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'เรียนรู้เกี่ยวกับดัชนีระดับโลก (เช่น S&P 500) ETF และวิธีการสร้างความเสี่ยงในระดับสากลอย่างมีระเบียบวินัย';

  @override
  String get strategy_deepDive_taxesTitle => 'ภาษีและการรายงาน (ขั้นสูง)';

  @override
  String get strategy_deepDive_taxesBody =>
      'ทำความเข้าใจแนวคิดหลักด้านภาษีและวิธีเก็บบันทึกเพื่อรายงานการลงทุนอย่างปลอดภัย';

  @override
  String get strategy_premiumLockedBody =>
      'เนื้อหาพรีเมียม เปิดใช้งานธีม Cyber/Grimm/Hive เพื่อปลดล็อกการลงทุนแบบ Deep Dive';

  @override
  String get homeShowcaseTitle => 'ตู้โชว์';

  @override
  String get homeShowcaseProfileSimTitle => 'แบบทดสอบโปรไฟล์ความเสี่ยง';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'ค้นหาโปรไฟล์นักลงทุนของคุณในไม่กี่นาที';

  @override
  String get homeShowcaseStrategiesTitle => 'กลยุทธ์ที่แนะนำ';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'ทางลัดโดยตรงเพื่อเรียนรู้และใช้กลยุทธ์';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: แบบทดสอบและกลยุทธ์';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'เข้าถึงแบบทดสอบโปรไฟล์ความเสี่ยงและกลยุทธ์ที่แนะนำได้อย่างรวดเร็ว';

  @override
  String get homeTourStepClassicTitle => 'โหมดคลาสสิก';

  @override
  String get homeTourStepClassicBody =>
      'เปิดแผงแอปดั้งเดิม: ธุรกรรม เป้าหมาย การลงทุน และการตั้งค่าในรูปแบบที่คุ้นเคย';

  @override
  String get homeTourStepVitrineTitle => 'พื้นที่จัดแสดง';

  @override
  String get homeTourStepVitrineBody =>
      'ทางลัดเพื่อเรียนรู้และฝึกฝน: ประวัตินักลงทุน กลยุทธ์ และศูนย์ที่ปรึกษา\nแบบทดสอบโปรไฟล์';

  @override
  String get homeTourStepProfileTitle => '';

  @override
  String get homeTourStepProfileBody =>
      'ตอบแบบสอบถามเพื่อค้นหาโปรไฟล์ความเสี่ยงของคุณและดูคำแนะนำที่สอดคล้องกัน';

  @override
  String get homeTourStepStrategiesTitle => 'กลยุทธ์';

  @override
  String get homeTourStepStrategiesBody =>
      'เนื้อหาเพื่อจัดระเบียบการเงิน ลงทุนอย่างมีวินัย และหลีกเลี่ยงข้อผิดพลาดทั่วไป';

  @override
  String get homeTourStepHubTitle => 'ดุมเมนเทอร์';

  @override
  String get homeTourStepHubBody =>
      'เมนูด่วนสำหรับแบบทดสอบโปรไฟล์และกลยุทธ์ที่แนะนำ';

  @override
  String get homeTourStepPremiumTitle => 'ฟีเจอร์พรีเมียม';

  @override
  String get homeTourStepPremiumBody =>
      'การให้คำปรึกษาอัตโนมัติ แผนภูมิขั้นสูง และรายงานรายเดือน — พร้อมให้ใช้งานเมื่อสมัครสมาชิกระดับพรีเมียม';

  @override
  String get homeTourStepMarketTitle => 'ภาพรวมตลาด\nบริบทของตลาด';

  @override
  String get homeTourStepMarketBody =>
      '(บราซิลหรือทั่วโลก) ขึ้นอยู่กับภูมิภาคของคุณบวกมูลค่าสุทธิที่แปลงแล้ว';

  @override
  String get homeTourStepCalculatorTitle => 'เครื่องคิดเลขเมนเทอร์';

  @override
  String get homeTourStepCalculatorBody =>
      'จำลองดอกเบี้ยทบต้น อัตราเงินเฟ้อ และดูแผนภูมิความมั่งคั่ง ต่อไปเราจะเปิดเครื่องมือนี้';

  @override
  String get quizProfile_title => 'แบบทดสอบโปรไฟล์ความเสี่ยง';

  @override
  String quizProfile_progress(int current, int total) {
    return 'คำถาม $current จาก $total';
  }

  @override
  String get quizProfile_badge => 'แบบทดสอบโปรไฟล์ความเสี่ยง';

  @override
  String get quizProfile_resultTitle => 'โปรไฟล์ของคุณคือ';

  @override
  String get quizProfile_idealInvestmentsTitle => 'การลงทุนในอุดมคติ:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'สำรวจการลงทุน';

  @override
  String get quizProfile_exit => 'ทางออก';

  @override
  String get quizKnowledge_title => 'แบบทดสอบความรู้';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'คำถาม $current จาก $total';
  }
}
