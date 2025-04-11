import 'package:cupertino_country_picker/gen/assets.gen.dart' show Assets;
import 'package:cupertino_country_picker/model/country_model.dart' show CountryModel;

class CountryPickerHelper {
  static final packageName = 'cupertino_country_picker';

  static final countryList = countryJsonList
      .map((jsonItem) => CountryModel.fromJson(jsonItem))
      .toList();

  static CountryModel? getByCountryCode(String code) {
    try {
      return countryList.firstWhere(
          (country) => country.countryCode.toLowerCase() == code.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  static CountryModel? getByName(String name) {
    try {
      return countryList.firstWhere(
          (country) => country.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  static CountryModel? getByCallingCode(String callingCode) {
    try {
      return countryList
          .firstWhere((country) => country.callingCode == callingCode);
    } catch (e) {
      return null;
    }
  }

  static List<CountryModel> getListByQuery(String query) {
    try {
      final formatedQuery = query.trim().toLowerCase();
      return countryList.where((country) {
        final nameMatch = country.name.toLowerCase().contains(formatedQuery);
        final codeMatch =
            country.callingCode.toLowerCase().contains(formatedQuery);
        return nameMatch || codeMatch;
      }).toList();
    } catch (e) {
      return [];
    }
  }

  static final countryJsonList = [
    {
      'country_code': 'AF',
      'name': 'Afghanistan',
      'calling_code': '+93',
      'flag': Assets.flags.afg.path
    },
    {
      'country_code': 'AX',
      'name': 'Åland Islands',
      'calling_code': '+358',
      'flag': Assets.flags.ala.path
    },
    {
      'country_code': 'AL',
      'name': 'Albania',
      'calling_code': '+355',
      'flag': Assets.flags.alb.path
    },
    {
      'country_code': 'DZ',
      'name': 'Algeria',
      'calling_code': '+213',
      'flag': Assets.flags.dza.path
    },
    {
      'country_code': 'AS',
      'name': 'American Samoa',
      'calling_code': '+1684',
      'flag': Assets.flags.asm.path
    },
    {
      'country_code': 'AD',
      'name': 'Andorra',
      'calling_code': '+376',
      'flag': Assets.flags.and.path
    },
    {
      'country_code': 'AO',
      'name': 'Angola',
      'calling_code': '+244',
      'flag': Assets.flags.ago.path
    },
    {
      'country_code': 'AI',
      'name': 'Anguilla',
      'calling_code': '+1264',
      'flag': Assets.flags.aia.path
    },
    {
      'country_code': 'AQ',
      'name': 'Antarctica',
      'calling_code': '+672',
      'flag': Assets.flags.ata.path
    },
    {
      'country_code': 'AG',
      'name': 'Antigua and Barbuda',
      'calling_code': '+1268',
      'flag': Assets.flags.atg.path
    },
    {
      'country_code': 'AR',
      'name': 'Argentina',
      'calling_code': '+54',
      'flag': Assets.flags.arg.path
    },
    {
      'country_code': 'AM',
      'name': 'Armenia',
      'calling_code': '+374',
      'flag': Assets.flags.arm.path
    },
    {
      'country_code': 'AW',
      'name': 'Aruba',
      'calling_code': '+297',
      'flag': Assets.flags.abw.path
    },
    {
      'country_code': 'AU',
      'name': 'Australia',
      'calling_code': '+61',
      'flag': Assets.flags.aus.path
    },
    {
      'country_code': 'AT',
      'name': 'Austria',
      'calling_code': '+43',
      'flag': Assets.flags.aut.path
    },
    {
      'country_code': 'AZ',
      'name': 'Azerbaijan',
      'calling_code': '+994',
      'flag': Assets.flags.aze.path
    },
    {
      'country_code': 'BS',
      'name': 'Bahamas',
      'calling_code': '+1242',
      'flag': Assets.flags.bhs.path
    },
    {
      'country_code': 'BH',
      'name': 'Bahrain',
      'calling_code': '+973',
      'flag': Assets.flags.bhr.path
    },
    {
      'country_code': 'BD',
      'name': 'Bangladesh',
      'calling_code': '+880',
      'flag': Assets.flags.bgd.path
    },
    {
      'country_code': 'BB',
      'name': 'Barbados',
      'calling_code': '+1246',
      'flag': Assets.flags.brb.path
    },
    {
      'country_code': 'BY',
      'name': 'Belarus',
      'calling_code': '+375',
      'flag': Assets.flags.blr.path
    },
    {
      'country_code': 'BE',
      'name': 'Belgium',
      'calling_code': '+32',
      'flag': Assets.flags.bel.path
    },
    {
      'country_code': 'BZ',
      'name': 'Belize',
      'calling_code': '+501',
      'flag': Assets.flags.blz.path
    },
    {
      'country_code': 'BJ',
      'name': 'Benin',
      'calling_code': '+229',
      'flag': Assets.flags.ben.path
    },
    {
      'country_code': 'BM',
      'name': 'Bermuda',
      'calling_code': '+1441',
      'flag': Assets.flags.bmu.path
    },
    {
      'country_code': 'BT',
      'name': 'Bhutan',
      'calling_code': '+975',
      'flag': Assets.flags.btn.path
    },
    {
      'country_code': 'BO',
      'name': 'Bolivia (Plurinational State of)',
      'calling_code': '+591',
      'flag': Assets.flags.bol.path
    },
    {
      'country_code': 'BQ',
      'name': 'Bonaire, Sint Eustatius and Saba',
      'calling_code': '+5997',
      'flag': Assets.flags.bes.path
    },
    {
      'country_code': 'BA',
      'name': 'Bosnia and Herzegovina',
      'calling_code': '+387',
      'flag': Assets.flags.bih.path
    },
    {
      'country_code': 'BW',
      'name': 'Botswana',
      'calling_code': '+267',
      'flag': Assets.flags.bwa.path
    },
    {
      'country_code': 'BV',
      'name': 'Bouvet Island',
      'calling_code': '+55',
      'flag': Assets.flags.bvt.path
    },
    {
      'country_code': 'BR',
      'name': 'Brazil',
      'calling_code': '+55',
      'flag': Assets.flags.bra.path
    },
    {
      'country_code': 'IO',
      'name': 'British Indian Ocean Territory',
      'calling_code': '+246',
      'flag': Assets.flags.iot.path
    },
    {
      'country_code': 'UM',
      'name': 'United States Minor Outlying Islands',
      'calling_code': '+246',
      'flag': Assets.flags.umi.path
    },
    {
      'country_code': 'VG',
      'name': 'Virgin Islands (British)',
      'calling_code': '+1284',
      'flag': Assets.flags.vgb.path
    },
    {
      'country_code': 'VI',
      'name': 'Virgin Islands (U.S.)',
      'calling_code': '+1 340',
      'flag': Assets.flags.vir.path
    },
    {
      'country_code': 'BN',
      'name': 'Brunei Darussalam',
      'calling_code': '+673',
      'flag': Assets.flags.brn.path
    },
    {
      'country_code': 'BG',
      'name': 'Bulgaria',
      'calling_code': '+359',
      'flag': Assets.flags.bgr.path
    },
    {
      'country_code': 'BF',
      'name': 'Burkina Faso',
      'calling_code': '+226',
      'flag': Assets.flags.bfa.path
    },
    {
      'country_code': 'BI',
      'name': 'Burundi',
      'calling_code': '+257',
      'flag': Assets.flags.bdi.path
    },
    {
      'country_code': 'KH',
      'name': 'Cambodia',
      'calling_code': '+855',
      'flag': Assets.flags.khm.path
    },
    {
      'country_code': 'CM',
      'name': 'Cameroon',
      'calling_code': '+237',
      'flag': Assets.flags.cmr.path
    },
    {
      'country_code': 'CA',
      'name': 'Canada',
      'calling_code': '+1',
      'flag': Assets.flags.can.path
    },
    {
      'country_code': 'CV',
      'name': 'Cabo Verde',
      'calling_code': '+238',
      'flag': Assets.flags.cpv.path
    },
    {
      'country_code': 'KY',
      'name': 'Cayman Islands',
      'calling_code': '+1345',
      'flag': Assets.flags.cym.path
    },
    {
      'country_code': 'CF',
      'name': 'Central African Republic',
      'calling_code': '+236',
      'flag': Assets.flags.caf.path
    },
    {
      'country_code': 'TD',
      'name': 'Chad',
      'calling_code': '+235',
      'flag': Assets.flags.tcd.path
    },
    {
      'country_code': 'CL',
      'name': 'Chile',
      'calling_code': '+56',
      'flag': Assets.flags.chl.path
    },
    {
      'country_code': 'CN',
      'name': 'China',
      'calling_code': '+86',
      'flag': Assets.flags.chn.path
    },
    {
      'country_code': 'CX',
      'name': 'Christmas Island',
      'calling_code': '+61',
      'flag': Assets.flags.cxr.path
    },
    {
      'country_code': 'CC',
      'name': 'Cocos (Keeling) Islands',
      'calling_code': '+61',
      'flag': Assets.flags.cck.path
    },
    {
      'country_code': 'CO',
      'name': 'Colombia',
      'calling_code': '+57',
      'flag': Assets.flags.col.path
    },
    {
      'country_code': 'KM',
      'name': 'Comoros',
      'calling_code': '+269',
      'flag': Assets.flags.com.path
    },
    {
      'country_code': 'CG',
      'name': 'Congo',
      'calling_code': '+242',
      'flag': Assets.flags.cog.path
    },
    {
      'country_code': 'CD',
      'name': 'Congo (Democratic Republic of the)',
      'calling_code': '+243',
      'flag': Assets.flags.cod.path
    },
    {
      'country_code': 'CK',
      'name': 'Cook Islands',
      'calling_code': '+682',
      'flag': Assets.flags.cok.path
    },
    {
      'country_code': 'CR',
      'name': 'Costa Rica',
      'calling_code': '+506',
      'flag': Assets.flags.cri.path
    },
    {
      'country_code': 'HR',
      'name': 'Croatia',
      'calling_code': '+385',
      'flag': Assets.flags.hrv.path
    },
    {
      'country_code': 'CU',
      'name': 'Cuba',
      'calling_code': '+53',
      'flag': Assets.flags.cub.path
    },
    {
      'country_code': 'CW',
      'name': 'Curaçao',
      'calling_code': '+599',
      'flag': Assets.flags.cuw.path
    },
    {
      'country_code': 'CY',
      'name': 'Cyprus',
      'calling_code': '+357',
      'flag': Assets.flags.cyp.path
    },
    {
      'country_code': 'CZ',
      'name': 'Czech Republic',
      'calling_code': '+420',
      'flag': Assets.flags.cze.path
    },
    {
      'country_code': 'DK',
      'name': 'Denmark',
      'calling_code': '+45',
      'flag': Assets.flags.dnk.path
    },
    {
      'country_code': 'DJ',
      'name': 'Djibouti',
      'calling_code': '+253',
      'flag': Assets.flags.dji.path
    },
    {
      'country_code': 'DM',
      'name': 'Dominica',
      'calling_code': '+1767',
      'flag': Assets.flags.dma.path
    },
    {
      'country_code': 'DO',
      'name': 'Dominican Republic',
      'calling_code': '+1809',
      'flag': Assets.flags.dom.path
    },
    {
      'country_code': 'EC',
      'name': 'Ecuador',
      'calling_code': '+593',
      'flag': Assets.flags.ecu.path
    },
    {
      'country_code': 'EG',
      'name': 'Egypt',
      'calling_code': '+20',
      'flag': Assets.flags.egy.path
    },
    {
      'country_code': 'SV',
      'name': 'El Salvador',
      'calling_code': '+503',
      'flag': Assets.flags.slv.path
    },
    {
      'country_code': 'GQ',
      'name': 'Equatorial Guinea',
      'calling_code': '+240',
      'flag': Assets.flags.gnq.path
    },
    {
      'country_code': 'ER',
      'name': 'Eritrea',
      'calling_code': '+291',
      'flag': Assets.flags.eri.path
    },
    {
      'country_code': 'EE',
      'name': 'Estonia',
      'calling_code': '+372',
      'flag': Assets.flags.est.path
    },
    {
      'country_code': 'ET',
      'name': 'Ethiopia',
      'calling_code': '+251',
      'flag': Assets.flags.eth.path
    },
    {
      'country_code': 'FK',
      'name': 'Falkland Islands (Malvinas)',
      'calling_code': '+500',
      'flag': Assets.flags.flk.path
    },
    {
      'country_code': 'FO',
      'name': 'Faroe Islands',
      'calling_code': '+298',
      'flag': Assets.flags.fro.path
    },
    {
      'country_code': 'FJ',
      'name': 'Fiji',
      'calling_code': '+679',
      'flag': Assets.flags.fji.path
    },
    {
      'country_code': 'FI',
      'name': 'Finland',
      'calling_code': '+358',
      'flag': Assets.flags.fin.path
    },
    {
      'country_code': 'FR',
      'name': 'France',
      'calling_code': '+33',
      'flag': Assets.flags.fra.path
    },
    {
      'country_code': 'GF',
      'name': 'French Guiana',
      'calling_code': '+594',
      'flag': Assets.flags.guf.path
    },
    {
      'country_code': 'PF',
      'name': 'French Polynesia',
      'calling_code': '+689',
      'flag': Assets.flags.pyf.path
    },
    {
      'country_code': 'TF',
      'name': 'French Southern Territories',
      'calling_code': '+262',
      'flag': Assets.flags.atf.path
    },
    {
      'country_code': 'GA',
      'name': 'Gabon',
      'calling_code': '+241',
      'flag': Assets.flags.gab.path
    },
    {
      'country_code': 'GM',
      'name': 'Gambia',
      'calling_code': '+220',
      'flag': Assets.flags.gmb.path
    },
    {
      'country_code': 'GE',
      'name': 'Georgia',
      'calling_code': '+995',
      'flag': Assets.flags.geo.path
    },
    {
      'country_code': 'DE',
      'name': 'Germany',
      'calling_code': '+49',
      'flag': Assets.flags.deu.path
    },
    {
      'country_code': 'GH',
      'name': 'Ghana',
      'calling_code': '+233',
      'flag': Assets.flags.gha.path
    },
    {
      'country_code': 'GI',
      'name': 'Gibraltar',
      'calling_code': '+350',
      'flag': Assets.flags.gib.path
    },
    {
      'country_code': 'GR',
      'name': 'Greece',
      'calling_code': '+30',
      'flag': Assets.flags.grc.path
    },
    {
      'country_code': 'GL',
      'name': 'Greenland',
      'calling_code': '+299',
      'flag': Assets.flags.grl.path
    },
    {
      'country_code': 'GD',
      'name': 'Grenada',
      'calling_code': '+1473',
      'flag': Assets.flags.grd.path
    },
    {
      'country_code': 'GP',
      'name': 'Guadeloupe',
      'calling_code': '+590',
      'flag': Assets.flags.glp.path
    },
    {
      'country_code': 'GU',
      'name': 'Guam',
      'calling_code': '+1671',
      'flag': Assets.flags.gum.path
    },
    {
      'country_code': 'GT',
      'name': 'Guatemala',
      'calling_code': '+502',
      'flag': Assets.flags.gtm.path
    },
    {
      'country_code': 'GG',
      'name': 'Guernsey',
      'calling_code': '+44',
      'flag': Assets.flags.ggy.path
    },
    {
      'country_code': 'GN',
      'name': 'Guinea',
      'calling_code': '+224',
      'flag': Assets.flags.gin.path
    },
    {
      'country_code': 'GW',
      'name': 'Guinea-Bissau',
      'calling_code': '+245',
      'flag': Assets.flags.gnb.path
    },
    {
      'country_code': 'GY',
      'name': 'Guyana',
      'calling_code': '+592',
      'flag': Assets.flags.guy.path
    },
    {
      'country_code': 'HT',
      'name': 'Haiti',
      'calling_code': '+509',
      'flag': Assets.flags.hti.path
    },
    {
      'country_code': 'HM',
      'name': 'Heard Island and McDonald Islands',
      'calling_code': '+672',
      'flag': Assets.flags.hmd.path
    },
    {
      'country_code': 'VA',
      'name': 'Holy See',
      'calling_code': '+379',
      'flag': Assets.flags.vat.path
    },
    {
      'country_code': 'HN',
      'name': 'Honduras',
      'calling_code': '+504',
      'flag': Assets.flags.hnd.path
    },
    {
      'country_code': 'HK',
      'name': 'Hong Kong',
      'calling_code': '+852',
      'flag': Assets.flags.hkg.path
    },
    {
      'country_code': 'HU',
      'name': 'Hungary',
      'calling_code': '+36',
      'flag': Assets.flags.hun.path
    },
    {
      'country_code': 'IS',
      'name': 'Iceland',
      'calling_code': '+354',
      'flag': Assets.flags.isl.path
    },
    {
      'country_code': 'IN',
      'name': 'India',
      'calling_code': '+91',
      'flag': Assets.flags.ind.path
    },
    {
      'country_code': 'ID',
      'name': 'Indonesia',
      'calling_code': '+62',
      'flag': Assets.flags.idn.path
    },
    {
      'country_code': 'CI',
      'name': 'Côte d\'Ivoire',
      'calling_code': '+225',
      'flag': Assets.flags.civ.path
    },
    {
      'country_code': 'IR',
      'name': 'Iran (Islamic Republic of)',
      'calling_code': '+98',
      'flag': Assets.flags.irn.path
    },
    {
      'country_code': 'IQ',
      'name': 'Iraq',
      'calling_code': '+964',
      'flag': Assets.flags.irq.path
    },
    {
      'country_code': 'IE',
      'name': 'Ireland',
      'calling_code': '+353',
      'flag': Assets.flags.irl.path
    },
    {
      'country_code': 'IM',
      'name': 'Isle of Man',
      'calling_code': '+44',
      'flag': Assets.flags.imn.path
    },
    {
      'country_code': 'IL',
      'name': 'Israel',
      'calling_code': '+972',
      'flag': Assets.flags.isr.path
    },
    {
      'country_code': 'IT',
      'name': 'Italy',
      'calling_code': '+39',
      'flag': Assets.flags.ita.path
    },
    {
      'country_code': 'JM',
      'name': 'Jamaica',
      'calling_code': '+1876',
      'flag': Assets.flags.jam.path
    },
    {
      'country_code': 'JP',
      'name': 'Japan',
      'calling_code': '+81',
      'flag': Assets.flags.jpn.path
    },
    {
      'country_code': 'JE',
      'name': 'Jersey',
      'calling_code': '+44',
      'flag': Assets.flags.jey.path
    },
    {
      'country_code': 'JO',
      'name': 'Jordan',
      'calling_code': '+962',
      'flag': Assets.flags.jor.path
    },
    {
      'country_code': 'KZ',
      'name': 'Kazakhstan',
      'calling_code': '+76',
      'flag': Assets.flags.kaz.path
    },
    {
      'country_code': 'KE',
      'name': 'Kenya',
      'calling_code': '+254',
      'flag': Assets.flags.ken.path
    },
    {
      'country_code': 'KI',
      'name': 'Kiribati',
      'calling_code': '+686',
      'flag': Assets.flags.kir.path
    },
    {
      'country_code': 'KW',
      'name': 'Kuwait',
      'calling_code': '+965',
      'flag': Assets.flags.kwt.path
    },
    {
      'country_code': 'KG',
      'name': 'Kyrgyzstan',
      'calling_code': '+996',
      'flag': Assets.flags.kgz.path
    },
    {
      'country_code': 'LA',
      'name': 'Lao People\'s Democratic Republic',
      'calling_code': '+856',
      'flag': Assets.flags.lao.path
    },
    {
      'country_code': 'LV',
      'name': 'Latvia',
      'calling_code': '+371',
      'flag': Assets.flags.lva.path
    },
    {
      'country_code': 'LB',
      'name': 'Lebanon',
      'calling_code': '+961',
      'flag': Assets.flags.lbn.path
    },
    {
      'country_code': 'LS',
      'name': 'Lesotho',
      'calling_code': '+266',
      'flag': Assets.flags.lso.path
    },
    {
      'country_code': 'LR',
      'name': 'Liberia',
      'calling_code': '+231',
      'flag': Assets.flags.lbr.path
    },
    {
      'country_code': 'LY',
      'name': 'Libya',
      'calling_code': '+218',
      'flag': Assets.flags.lby.path
    },
    {
      'country_code': 'LI',
      'name': 'Liechtenstein',
      'calling_code': '+423',
      'flag': Assets.flags.lie.path
    },
    {
      'country_code': 'LT',
      'name': 'Lithuania',
      'calling_code': '+370',
      'flag': Assets.flags.ltu.path
    },
    {
      'country_code': 'LU',
      'name': 'Luxembourg',
      'calling_code': '+352',
      'flag': Assets.flags.lux.path
    },
    {
      'country_code': 'MO',
      'name': 'Macao',
      'calling_code': '+853',
      'flag': Assets.flags.mac.path
    },
    {
      'country_code': 'MK',
      'name': 'Macedonia (the former Yugoslav Republic of)',
      'calling_code': '+389',
      'flag': Assets.flags.mkd.path
    },
    {
      'country_code': 'MG',
      'name': 'Madagascar',
      'calling_code': '+261',
      'flag': Assets.flags.mdg.path
    },
    {
      'country_code': 'MW',
      'name': 'Malawi',
      'calling_code': '+265',
      'flag': Assets.flags.mwi.path
    },
    {
      'country_code': 'MY',
      'name': 'Malaysia',
      'calling_code': '+60',
      'flag': Assets.flags.mys.path
    },
    {
      'country_code': 'MV',
      'name': 'Maldives',
      'calling_code': '+960',
      'flag': Assets.flags.mdv.path
    },
    {
      'country_code': 'ML',
      'name': 'Mali',
      'calling_code': '+223',
      'flag': Assets.flags.mli.path
    },
    {
      'country_code': 'MT',
      'name': 'Malta',
      'calling_code': '+356',
      'flag': Assets.flags.mlt.path
    },
    {
      'country_code': 'MH',
      'name': 'Marshall Islands',
      'calling_code': '+692',
      'flag': Assets.flags.mhl.path
    },
    {
      'country_code': 'MQ',
      'name': 'Martinique',
      'calling_code': '+596',
      'flag': Assets.flags.mtq.path
    },
    {
      'country_code': 'MR',
      'name': 'Mauritania',
      'calling_code': '+222',
      'flag': Assets.flags.mrt.path
    },
    {
      'country_code': 'MU',
      'name': 'Mauritius',
      'calling_code': '+230',
      'flag': Assets.flags.mus.path
    },
    {
      'country_code': 'YT',
      'name': 'Mayotte',
      'calling_code': '+262',
      'flag': Assets.flags.myt.path
    },
    {
      'country_code': 'MX',
      'name': 'Mexico',
      'calling_code': '+52',
      'flag': Assets.flags.mex.path
    },
    {
      'country_code': 'FM',
      'name': 'Micronesia (Federated States of)',
      'calling_code': '+691',
      'flag': Assets.flags.fsm.path
    },
    {
      'country_code': 'MD',
      'name': 'Moldova (Republic of)',
      'calling_code': '+373',
      'flag': Assets.flags.mda.path
    },
    {
      'country_code': 'MC',
      'name': 'Monaco',
      'calling_code': '+377',
      'flag': Assets.flags.mco.path
    },
    {
      'country_code': 'MN',
      'name': 'Mongolia',
      'calling_code': '+976',
      'flag': Assets.flags.mng.path
    },
    {
      'country_code': 'ME',
      'name': 'Montenegro',
      'calling_code': '+382',
      'flag': Assets.flags.mne.path
    },
    {
      'country_code': 'MS',
      'name': 'Montserrat',
      'calling_code': '+1664',
      'flag': Assets.flags.msr.path
    },
    {
      'country_code': 'MA',
      'name': 'Morocco',
      'calling_code': '+212',
      'flag': Assets.flags.mar.path
    },
    {
      'country_code': 'MZ',
      'name': 'Mozambique',
      'calling_code': '+258',
      'flag': Assets.flags.moz.path
    },
    {
      'country_code': 'MM',
      'name': 'Myanmar',
      'calling_code': '+95',
      'flag': Assets.flags.mmr.path
    },
    {
      'country_code': 'NA',
      'name': 'Namibia',
      'calling_code': '+264',
      'flag': Assets.flags.nam.path
    },
    {
      'country_code': 'NR',
      'name': 'Nauru',
      'calling_code': '+674',
      'flag': Assets.flags.nru.path
    },
    {
      'country_code': 'NP',
      'name': 'Nepal',
      'calling_code': '+977',
      'flag': Assets.flags.npl.path
    },
    {
      'country_code': 'NL',
      'name': 'Netherlands',
      'calling_code': '+31',
      'flag': Assets.flags.nld.path
    },
    {
      'country_code': 'NC',
      'name': 'New Caledonia',
      'calling_code': '+687',
      'flag': Assets.flags.ncl.path
    },
    {
      'country_code': 'NZ',
      'name': 'New Zealand',
      'calling_code': '+64',
      'flag': Assets.flags.nzl.path
    },
    {
      'country_code': 'NI',
      'name': 'Nicaragua',
      'calling_code': '+505',
      'flag': Assets.flags.nic.path
    },
    {
      'country_code': 'NE',
      'name': 'Niger',
      'calling_code': '+227',
      'flag': Assets.flags.ner.path
    },
    {
      'country_code': 'NG',
      'name': 'Nigeria',
      'calling_code': '+234',
      'flag': Assets.flags.nga.path
    },
    {
      'country_code': 'NU',
      'name': 'Niue',
      'calling_code': '+683',
      'flag': Assets.flags.niu.path
    },
    {
      'country_code': 'NF',
      'name': 'Norfolk Island',
      'calling_code': '+672',
      'flag': Assets.flags.nfk.path
    },
    {
      'country_code': 'KP',
      'name': 'Korea (Democratic People\'s Republic of)',
      'calling_code': '+850',
      'flag': Assets.flags.prk.path
    },
    {
      'country_code': 'MP',
      'name': 'Northern Mariana Islands',
      'calling_code': '+1670',
      'flag': Assets.flags.mnp.path
    },
    {
      'country_code': 'NO',
      'name': 'Norway',
      'calling_code': '+47',
      'flag': Assets.flags.nor.path
    },
    {
      'country_code': 'OM',
      'name': 'Oman',
      'calling_code': '+968',
      'flag': Assets.flags.omn.path
    },
    {
      'country_code': 'PK',
      'name': 'Pakistan',
      'calling_code': '+92',
      'flag': Assets.flags.pak.path
    },
    {
      'country_code': 'PW',
      'name': 'Palau',
      'calling_code': '+680',
      'flag': Assets.flags.plw.path
    },
    {
      'country_code': 'PS',
      'name': 'Palestine, State of',
      'calling_code': '+970',
      'flag': Assets.flags.pse.path
    },
    {
      'country_code': 'PA',
      'name': 'Panama',
      'calling_code': '+507',
      'flag': Assets.flags.pan.path
    },
    {
      'country_code': 'PG',
      'name': 'Papua New Guinea',
      'calling_code': '+675',
      'flag': Assets.flags.png.path
    },
    {
      'country_code': 'PY',
      'name': 'Paraguay',
      'calling_code': '+595',
      'flag': Assets.flags.pry.path
    },
    {
      'country_code': 'PE',
      'name': 'Peru',
      'calling_code': '+51',
      'flag': Assets.flags.per.path
    },
    {
      'country_code': 'PH',
      'name': 'Philippines',
      'calling_code': '+63',
      'flag': Assets.flags.phl.path
    },
    {
      'country_code': 'PN',
      'name': 'Pitcairn',
      'calling_code': '+64',
      'flag': Assets.flags.pcn.path
    },
    {
      'country_code': 'PL',
      'name': 'Poland',
      'calling_code': '+48',
      'flag': Assets.flags.pol.path
    },
    {
      'country_code': 'PT',
      'name': 'Portugal',
      'calling_code': '+351',
      'flag': Assets.flags.prt.path
    },
    {
      'country_code': 'PR',
      'name': 'Puerto Rico',
      'calling_code': '+1787',
      'flag': Assets.flags.pri.path
    },
    {
      'country_code': 'QA',
      'name': 'Qatar',
      'calling_code': '+974',
      'flag': Assets.flags.qat.path
    },
    {
      'country_code': 'XK',
      'name': 'Republic of Kosovo',
      'calling_code': '+383',
      'flag': Assets.flags.kos.path
    },
    {
      'country_code': 'RE',
      'name': 'Réunion',
      'calling_code': '+262',
      'flag': Assets.flags.reu.path
    },
    {
      'country_code': 'RO',
      'name': 'Romania',
      'calling_code': '+40',
      'flag': Assets.flags.rou.path
    },
    {
      'country_code': 'RU',
      'name': 'Russian Federation',
      'calling_code': '+7',
      'flag': Assets.flags.rus.path
    },
    {
      'country_code': 'RW',
      'name': 'Rwanda',
      'calling_code': '+250',
      'flag': Assets.flags.rwa.path
    },
    {
      'country_code': 'BL',
      'name': 'Saint Barthélemy',
      'calling_code': '+590',
      'flag': Assets.flags.blm.path
    },
    {
      'country_code': 'SH',
      'name': 'Saint Helena, Ascension and Tristan da Cunha',
      'calling_code': '+290',
      'flag': Assets.flags.shn.path
    },
    {
      'country_code': 'KN',
      'name': 'Saint Kitts and Nevis',
      'calling_code': '+1869',
      'flag': Assets.flags.kna.path
    },
    {
      'country_code': 'LC',
      'name': 'Saint Lucia',
      'calling_code': '+1758',
      'flag': Assets.flags.lca.path
    },
    {
      'country_code': 'MF',
      'name': 'Saint Martin (French part)',
      'calling_code': '+590',
      'flag': Assets.flags.maf.path
    },
    {
      'country_code': 'PM',
      'name': 'Saint Pierre and Miquelon',
      'calling_code': '+508',
      'flag': Assets.flags.spm.path
    },
    {
      'country_code': 'VC',
      'name': 'Saint Vincent and the Grenadines',
      'calling_code': '+1784',
      'flag': Assets.flags.vct.path
    },
    {
      'country_code': 'WS',
      'name': 'Samoa',
      'calling_code': '+685',
      'flag': Assets.flags.wsm.path
    },
    {
      'country_code': 'SM',
      'name': 'San Marino',
      'calling_code': '+378',
      'flag': Assets.flags.smr.path
    },
    {
      'country_code': 'ST',
      'name': 'Sao Tome and Principe',
      'calling_code': '+239',
      'flag': Assets.flags.stp.path
    },
    {
      'country_code': 'SA',
      'name': 'Saudi Arabia',
      'calling_code': '+966',
      'flag': Assets.flags.sau.path
    },
    {
      'country_code': 'SN',
      'name': 'Senegal',
      'calling_code': '+221',
      'flag': Assets.flags.sen.path
    },
    {
      'country_code': 'RS',
      'name': 'Serbia',
      'calling_code': '+381',
      'flag': Assets.flags.srb.path
    },
    {
      'country_code': 'SC',
      'name': 'Seychelles',
      'calling_code': '+248',
      'flag': Assets.flags.syc.path
    },
    {
      'country_code': 'SL',
      'name': 'Sierra Leone',
      'calling_code': '+232',
      'flag': Assets.flags.sle.path
    },
    {
      'country_code': 'SG',
      'name': 'Singapore',
      'calling_code': '+65',
      'flag': Assets.flags.sgp.path
    },
    {
      'country_code': 'SX',
      'name': 'Sint Maarten (Dutch part)',
      'calling_code': '+1721',
      'flag': Assets.flags.sxm.path
    },
    {
      'country_code': 'SK',
      'name': 'Slovakia',
      'calling_code': '+421',
      'flag': Assets.flags.svk.path
    },
    {
      'country_code': 'SI',
      'name': 'Slovenia',
      'calling_code': '+386',
      'flag': Assets.flags.svn.path
    },
    {
      'country_code': 'SB',
      'name': 'Solomon Islands',
      'calling_code': '+677',
      'flag': Assets.flags.slb.path
    },
    {
      'country_code': 'SO',
      'name': 'Somalia',
      'calling_code': '+252',
      'flag': Assets.flags.som.path
    },
    {
      'country_code': 'ZA',
      'name': 'South Africa',
      'calling_code': '+27',
      'flag': Assets.flags.zaf.path
    },
    {
      'country_code': 'GS',
      'name': 'South Georgia and the South Sandwich Islands',
      'calling_code': '+500',
      'flag': Assets.flags.sgs.path
    },
    {
      'country_code': 'KR',
      'name': 'Korea (Republic of)',
      'calling_code': '+82',
      'flag': Assets.flags.kor.path
    },
    {
      'country_code': 'SS',
      'name': 'South Sudan',
      'calling_code': '+211',
      'flag': Assets.flags.ssd.path
    },
    {
      'country_code': 'ES',
      'name': 'Spain',
      'calling_code': '+34',
      'flag': Assets.flags.esp.path
    },
    {
      'country_code': 'LK',
      'name': 'Sri Lanka',
      'calling_code': '+94',
      'flag': Assets.flags.lka.path
    },
    {
      'country_code': 'SD',
      'name': 'Sudan',
      'calling_code': '+249',
      'flag': Assets.flags.sdn.path
    },
    {
      'country_code': 'SR',
      'name': 'Suriname',
      'calling_code': '+597',
      'flag': Assets.flags.sur.path
    },
    {
      'country_code': 'SJ',
      'name': 'Svalbard and Jan Mayen',
      'calling_code': '+4779',
      'flag': Assets.flags.sjm.path
    },
    {
      'country_code': 'SZ',
      'name': 'Swaziland',
      'calling_code': '+268',
      'flag': Assets.flags.swz.path
    },
    {
      'country_code': 'SE',
      'name': 'Sweden',
      'calling_code': '+46',
      'flag': Assets.flags.swe.path
    },
    {
      'country_code': 'CH',
      'name': 'Switzerland',
      'calling_code': '+41',
      'flag': Assets.flags.che.path
    },
    {
      'country_code': 'SY',
      'name': 'Syrian Arab Republic',
      'calling_code': '+963',
      'flag': Assets.flags.syr.path
    },
    {
      'country_code': 'TW',
      'name': 'Taiwan',
      'calling_code': '+886',
      'flag': Assets.flags.twn.path
    },
    {
      'country_code': 'TJ',
      'name': 'Tajikistan',
      'calling_code': '+992',
      'flag': Assets.flags.tjk.path
    },
    {
      'country_code': 'TZ',
      'name': 'Tanzania, United Republic of',
      'calling_code': '+255',
      'flag': Assets.flags.tza.path
    },
    {
      'country_code': 'TH',
      'name': 'Thailand',
      'calling_code': '+66',
      'flag': Assets.flags.tha.path
    },
    {
      'country_code': 'TL',
      'name': 'Timor-Leste',
      'calling_code': '+670',
      'flag': Assets.flags.tls.path
    },
    {
      'country_code': 'TG',
      'name': 'Togo',
      'calling_code': '+228',
      'flag': Assets.flags.tgo.path
    },
    {
      'country_code': 'TK',
      'name': 'Tokelau',
      'calling_code': '+690',
      'flag': Assets.flags.tkl.path
    },
    {
      'country_code': 'TO',
      'name': 'Tonga',
      'calling_code': '+676',
      'flag': Assets.flags.ton.path
    },
    {
      'country_code': 'TT',
      'name': 'Trinidad and Tobago',
      'calling_code': '+1868',
      'flag': Assets.flags.tto.path
    },
    {
      'country_code': 'TN',
      'name': 'Tunisia',
      'calling_code': '+216',
      'flag': Assets.flags.tun.path
    },
    {
      'country_code': 'TR',
      'name': 'Turkey',
      'calling_code': '+90',
      'flag': Assets.flags.tur.path
    },
    {
      'country_code': 'TM',
      'name': 'Turkmenistan',
      'calling_code': '+993',
      'flag': Assets.flags.tkm.path
    },
    {
      'country_code': 'TC',
      'name': 'Turks and Caicos Islands',
      'calling_code': '+1649',
      'flag': Assets.flags.tca.path
    },
    {
      'country_code': 'TV',
      'name': 'Tuvalu',
      'calling_code': '+688',
      'flag': Assets.flags.tuv.path
    },
    {
      'country_code': 'UG',
      'name': 'Uganda',
      'calling_code': '+256',
      'flag': Assets.flags.uga.path
    },
    {
      'country_code': 'UA',
      'name': 'Ukraine',
      'calling_code': '+380',
      'flag': Assets.flags.ukr.path
    },
    {
      'country_code': 'AE',
      'name': 'United Arab Emirates',
      'calling_code': '+971',
      'flag': Assets.flags.are.path
    },
    {
      'country_code': 'GB',
      'name': 'United Kingdom of Great Britain and Northern Ireland',
      'calling_code': '+44',
      'flag': Assets.flags.gbr.path
    },
    {
      'country_code': 'US',
      'name': 'United States of America',
      'calling_code': '+1',
      'flag': Assets.flags.usa.path
    },
    {
      'country_code': 'UY',
      'name': 'Uruguay',
      'calling_code': '+598',
      'flag': Assets.flags.ury.path
    },
    {
      'country_code': 'UZ',
      'name': 'Uzbekistan',
      'calling_code': '+998',
      'flag': Assets.flags.uzb.path
    },
    {
      'country_code': 'VU',
      'name': 'Vanuatu',
      'calling_code': '+678',
      'flag': Assets.flags.vut.path
    },
    {
      'country_code': 'VE',
      'name': 'Venezuela (Bolivarian Republic of)',
      'calling_code': '+58',
      'flag': Assets.flags.ven.path
    },
    {
      'country_code': 'VN',
      'name': 'Viet Nam',
      'calling_code': '+84',
      'flag': Assets.flags.vnm.path
    },
    {
      'country_code': 'WF',
      'name': 'Wallis and Futuna',
      'calling_code': '+681',
      'flag': Assets.flags.wlf.path
    },
    {
      'country_code': 'EH',
      'name': 'Western Sahara',
      'calling_code': '+212',
      'flag': Assets.flags.esh.path
    },
    {
      'country_code': 'YE',
      'name': 'Yemen',
      'calling_code': '+967',
      'flag': Assets.flags.yem.path
    },
    {
      'country_code': 'ZM',
      'name': 'Zambia',
      'calling_code': '+260',
      'flag': Assets.flags.zmb.path
    },
    {
      'country_code': 'ZW',
      'name': 'Zimbabwe',
      'calling_code': '+263',
      'flag': Assets.flags.zwe.path
    }
  ];
}
