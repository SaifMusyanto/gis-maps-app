import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gis_maps_app/features/cv/data/models/analysis/analysis_model.dart';
import 'package:gis_maps_app/features/cv/data/models/cv/cv_model.dart';
import 'package:gis_maps_app/services/gemini_service.dart';

abstract class CvDataSource {
  Future<CvModel> analyzeCv(CvModel cv);
}

class CvDataSourceImpl extends CvDataSource {
  final GeminiService _geminiService = GeminiService();

  @override
  Future<CvModel> analyzeCv(CvModel cv) async {
    String prompt = 'Tujuan CV:\n';
    switch (cv.purpose) {
      case CvPurpose.career:
        prompt += 'Karir\n\n';
        if (cv.position != null) {
          prompt += 'Posisi:\n${cv.position}\n\n';
        }
        break;
      case CvPurpose.scholarship:
        prompt += 'Beasiswa\n\n';
        break;
      case CvPurpose.organization:
        prompt += 'Organisasi\n\n';
        break;
      case null:
        break;
    }
    if (cv.description != null) {
      prompt += 'Deskripsi:\n${cv.description}\n\n';
    }
    prompt += 'Prompt:\nBerikan penilaian terhadap CV saya. Berikan respon yang sesingkat mungkin namun tetap menjelaskan hasil analisis, gunakan Bahasa Indonesia kasual formal. Jika ada kata yang perlu di-highlight, maka gunakan simbol bintang (*) di antaranya.\n\n';
    prompt += 'Ketentuan Structured Output:\n';
    prompt += '"overview" berisi analisis ringkas keseluruhan CV dalam Bahasa Indonesia.\n';
    prompt += '"score" berupa nilai rating kualitas CV antara 1 hingga 100.\n';
    prompt += '"improvements" berisi maksimal 5 poin saran spesifik untuk meningkatkan kualitas CV dalam Bahasa Indonesia.\n';
    prompt += '"corrections" berisi maksimal 5 contoh kalimat yang sudah dikoreksi dan siap untuk disalin dan ditempel (copy-paste) oleh pengguna ke dalam CV mereka. Kalimat konten CV, bukan arahan kepada pengguna, tetapi hasil koreksi dari konten yang sudah ada dalam CV. Kalimat-kalimat ini harus mengikuti bahasa dalam CV, jika CV berbahasa Inggris maka respons untuk corrections juga Inggris, harus menyesuaikan isi CV.\n';
    prompt += '"keywords" berisi maksimal 10 rekomendasi kata kunci yang relevan untuk ditambahkan ke dalam CV, terutama yang berkaitan dengan keterampilan dan tujuan karir (bukan sekadar kata kunci dari deskripsi lowongan) dalam Bahasa Indonesia.\n';

    final schema = Schema(
      SchemaType.object,
      properties: {
        'overview': Schema(SchemaType.string),
        'recommended_keywords': Schema(
          SchemaType.array,
          items: Schema(SchemaType.string),
        ),
        'experiences': Schema(
          SchemaType.object,
          properties: {
            'score': Schema(SchemaType.integer),
            'analysis': Schema(SchemaType.string),
            'improvements': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            'corrections': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
          requiredProperties: [
            'score',
            'analysis',
          ],
        ),
        'skills': Schema(
          SchemaType.object,
          properties: {
            'score': Schema(SchemaType.integer),
            'analysis': Schema(SchemaType.string),
            'improvements': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            'corrections': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
          requiredProperties: [
            'score',
            'analysis',
            'improvements',
            'corrections',
          ],
        ),
        'education': Schema(
          SchemaType.object,
          properties: {
            'score': Schema(SchemaType.integer),
            'analysis': Schema(SchemaType.string),
            'improvements': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            'corrections': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
          requiredProperties: [
            'score',
            'analysis',
            'improvements',
            'corrections',
          ],
        ),
        'formatting': Schema(
          SchemaType.object,
          properties: {
            'score': Schema(SchemaType.integer),
            'analysis': Schema(SchemaType.string),
            'improvements': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            'corrections': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
          requiredProperties: [
            'score',
            'analysis',
            'improvements',
            'corrections',
          ],
        ),
        'ats_friendly': Schema(
          SchemaType.object,
          properties: {
            'score': Schema(SchemaType.integer),
            'analysis': Schema(SchemaType.string),
            'improvements': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
            'corrections': Schema(
              SchemaType.array,
              items: Schema(SchemaType.string),
            ),
          },
          requiredProperties: [
            'score',
            'analysis',
            'improvements',
            'corrections',
          ],
        ),
      },
      requiredProperties: [
        'overview',
        'recommended_keywords',
        'experiences',
        'skills',
        'education',
        'formatting',
        'ats_friendly',
      ],
    );

    final res = await _geminiService.uploadFileToGemini(cv.filePath!, prompt, schema);
    AnalysisModel analysisModel = AnalysisModel.fromJson(jsonDecode(res));
    int overallScore =
        (analysisModel.experiences.score ?? 0) +
        (analysisModel.skills.score ?? 0) +
        (analysisModel.education.score ?? 0) +
        (analysisModel.formatting.score ?? 0) +
        (analysisModel.atsFriendly.score ?? 0);
    overallScore = (overallScore / 5).round();

    CvModel cvModel = CvModel(
      fileName: cv.fileName,
      filePath: cv.filePath,
      purpose: cv.purpose,
      description: cv.description,
      position: cv.position,
      createdAt: cv.createdAt,
      overallScore: overallScore,
      analysis: analysisModel,
    );

    return cvModel;
  }
}