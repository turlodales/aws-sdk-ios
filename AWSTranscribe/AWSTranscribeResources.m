//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"serviceId\":\"Transcribe\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateLanguageModel\":{\
      \"name\":\"CreateLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLanguageModelRequest\"},\
      \"output\":{\"shape\":\"CreateLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom language model. Use Amazon S3 prefixes to provide the location of your input files. The time it takes to create your model depends on the size of your training data.</p>\"\
    },\
    \"CreateMedicalVocabulary\":{\
      \"name\":\"CreateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary that you can use to change how Amazon Transcribe Medical transcribes your audio file.</p>\"\
    },\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file.</p>\"\
    },\
    \"CreateVocabularyFilter\":{\
      \"name\":\"CreateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new vocabulary filter that you can use to filter words, such as profane words, from the output of a transcription job.</p>\"\
    },\
    \"DeleteLanguageModel\":{\
      \"name\":\"DeleteLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLanguageModelRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom language model using its name.</p>\"\
    },\
    \"DeleteMedicalTranscriptionJob\":{\
      \"name\":\"DeleteMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a transcription job generated by Amazon Transcribe Medical and any related information.</p>\"\
    },\
    \"DeleteMedicalVocabulary\":{\
      \"name\":\"DeleteMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary from Amazon Transcribe Medical.</p>\"\
    },\
    \"DeleteTranscriptionJob\":{\
      \"name\":\"DeleteTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary from Amazon Transcribe. </p>\"\
    },\
    \"DeleteVocabularyFilter\":{\
      \"name\":\"DeleteVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes a vocabulary filter.</p>\"\
    },\
    \"DescribeLanguageModel\":{\
      \"name\":\"DescribeLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLanguageModelRequest\"},\
      \"output\":{\"shape\":\"DescribeLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a single custom language model. Use this information to see details about the language model in your AWS account. You can also see whether the base language model used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model. If the language model wasn't created, you can use this operation to understand why Amazon Transcribe couldn't create it. </p>\"\
    },\
    \"GetMedicalTranscriptionJob\":{\
      \"name\":\"GetMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job from Amazon Transcribe Medical. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You find the results of the completed job in the <code>TranscriptFileUri</code> field.</p>\"\
    },\
    \"GetMedicalVocabulary\":{\
      \"name\":\"GetMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a medical vocabulary.</p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a vocabulary. </p>\"\
    },\
    \"GetVocabularyFilter\":{\
      \"name\":\"GetVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a vocabulary filter.</p>\"\
    },\
    \"ListLanguageModels\":{\
      \"name\":\"ListLanguageModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLanguageModelsRequest\"},\
      \"output\":{\"shape\":\"ListLanguageModelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides more information about the custom language models you've created. You can use the information in this list to find a specific custom language model. You can then use the operation to get more information about it.</p>\"\
    },\
    \"ListMedicalTranscriptionJobs\":{\
      \"name\":\"ListMedicalTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListMedicalTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists medical transcription jobs with a specified status or substring that matches their names.</p>\"\
    },\
    \"ListMedicalVocabularies\":{\
      \"name\":\"ListMedicalVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListMedicalVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If you don't enter a value in any of the request parameters, returns the entire list of vocabularies.</p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists transcription jobs with the specified status.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>\"\
    },\
    \"ListVocabularyFilters\":{\
      \"name\":\"ListVocabularyFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabularyFiltersRequest\"},\
      \"output\":{\"shape\":\"ListVocabularyFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about vocabulary filters.</p>\"\
    },\
    \"StartMedicalTranscriptionJob\":{\
      \"name\":\"StartMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts a batch job to transcribe medical speech to text.</p>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous job to transcribe speech to text.</p>\"\
    },\
    \"UpdateMedicalVocabulary\":{\
      \"name\":\"UpdateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates a vocabulary with new values that you provide in a different text file from the one you used to create the vocabulary. The <code>UpdateMedicalVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request.</p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>\"\
    },\
    \"UpdateVocabularyFilter\":{\
      \"name\":\"UpdateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates a vocabulary filter with a new list of filtered words.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. For example, if the entity that you're trying to delete doesn't exist or if it is in a non-terminal state (for example, it's \\\"in progress\\\"). See the exception <code>Message</code> field for more information.</p>\",\
      \"exception\":true\
    },\
    \"BaseModelName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NarrowBand\",\
        \"WideBand\"\
      ]\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CLMLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"hi-IN\",\
        \"es-US\",\
        \"en-GB\",\
        \"en-AU\"\
      ]\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There is already a resource with that name.</p>\",\
      \"exception\":true\
    },\
    \"ContentRedaction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RedactionType\",\
        \"RedactionOutput\"\
      ],\
      \"members\":{\
        \"RedactionType\":{\
          \"shape\":\"RedactionType\",\
          \"documentation\":\"<p>Request parameter that defines the entities to be redacted. The only accepted value is <code>PII</code>.</p>\"\
        },\
        \"RedactionOutput\":{\
          \"shape\":\"RedactionOutput\",\
          \"documentation\":\"<p>The output transcript file stored in either the default S3 bucket or in a bucket you specify.</p> <p>When you choose <code>redacted</code> Amazon Transcribe outputs only the redacted transcript.</p> <p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe outputs both the redacted and unredacted transcripts.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Settings for content redaction within a transcription job.</p>\"\
    },\
    \"CreateLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LanguageCode\",\
        \"BaseModelName\",\
        \"ModelName\",\
        \"InputDataConfig\"\
      ],\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language of the input text you're using to train your custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model used to create your custom language model.</p> <p>If you want to use your custom language model to transcribe audio with a sample rate of 16 kHz or greater, choose <code>Wideband</code>.</p> <p>If you want to use your custom language model to transcribe audio with a sample rate that is less than 16 kHz, choose <code>Narrowband</code>.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name you choose for your custom language model when you create it.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Contains the data access role and the Amazon S3 prefixes to read the required input files to create a custom language model.</p>\"\
        }\
      }\
    },\
    \"CreateLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code of the text you've used to create a custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model you've used to create a custom language model.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name you've chosen for your custom language model.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The data access role and Amazon S3 prefixes you've chosen to create your custom language model.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of the custom language model. When the status is <code>COMPLETED</code> the model is ready to use.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"VocabularyFileUri\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the custom vocabulary. This case-sensitive name must be unique within an AWS account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used for the entries in your custom vocabulary. The language code of your custom vocabulary must match the language code of your transcription job. US English (en-US) is the only language code available for Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The location in Amazon S3 of the text file you use to define your custom vocabulary. The URI must be in the same AWS Region as the resource that you're calling. Enter information about your <code>VocabularyFileUri</code> in the following format:</p> <p> <code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>The following is an example URI for a vocabulary file that is stored in Amazon S3:</p> <p> <code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code> </p> <p>For more information about Amazon S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary-med\\\">Medical Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary. The name must be unique within an AWS account and is case sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the entries in your custom vocabulary. US English (en-US) is the only valid language code for Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom vocabulary in Amazon Transcribe Medical. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that you created the vocabulary.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyFilterName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The vocabulary filter name. The name must be unique within the account that contains it. If you try to create a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>The specified file must be less than 50 KB of UTF-8 characters.</p> <p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the collection.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary filter was modified.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary. The name must be unique within an AWS account. The name is case sensitive. If you try to create a vocabulary with the same name as a previous vocabulary you will receive a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a>what-is-transcribe</a>.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings that contains the vocabulary entries. </p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was created.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"DataAccessRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"^arn:(aws|aws-cn|aws-us-gov|aws-iso-{0,1}[a-z]{0,1}):iam::[0-9]{0,63}:role/[A-Za-z0-9:_/+=,@.-]{0,1024}$\"\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model you're choosing to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name you provide to the <code>DeleteMedicalTranscriptionJob</code> object to delete a transcription job.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job to be deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to remove.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to delete. </p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you submit to get more information.</p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModel\":{\
          \"shape\":\"LanguageModel\",\
          \"documentation\":\"<p>The name of the custom language model you requested more information about.</p>\"\
        }\
      }\
    },\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job.</p>\"\
        }\
      }\
    },\
    \"GetMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the medical transcription job.</p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that you want information about. The value is case sensitive. </p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary returned by Amazon Transcribe Medical.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The valid language code for your vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the <code>VocabularyState</code> is <code>READY</code> then you can use it in the <code>StartMedicalTranscriptionJob</code> operation. </p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified with a text file different from the one that was previously used.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The location in Amazon S3 where the vocabulary is stored. Use this URI to get the contents of the vocabulary. You can download your vocabulary from the URI for a limited time.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the transcription job.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter for which to return information.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the contents of the vocabulary filter were updated.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The URI of the list of words in the vocabulary filter. You can use this URI to get the list of words.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return information about. The name is case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>\"\
        }\
      }\
    },\
    \"IdentifiedLanguageScore\":{\"type\":\"float\"},\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 prefix you specify to access the plain text files that you use to train your custom language model.</p>\"\
        },\
        \"TuningDataS3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 prefix you specify to access the plain text files that you use to tune your custom language model.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that uniquely identifies the permissions you've given Amazon Transcribe to access your Amazon S3 buckets containing your media files or text data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object that contains the Amazon S3 object location and access role required to train and tune your custom language model.</p>\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"JobExecutionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowDeferredExecution\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe assumes this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about when a transcription job should be executed.</p>\"\
    },\
    \"KMSKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"af-ZA\",\
        \"ar-AE\",\
        \"ar-SA\",\
        \"cy-GB\",\
        \"da-DK\",\
        \"de-CH\",\
        \"de-DE\",\
        \"en-AB\",\
        \"en-AU\",\
        \"en-GB\",\
        \"en-IE\",\
        \"en-IN\",\
        \"en-US\",\
        \"en-WL\",\
        \"es-ES\",\
        \"es-US\",\
        \"fa-IR\",\
        \"fr-CA\",\
        \"fr-FR\",\
        \"ga-IE\",\
        \"gd-GB\",\
        \"he-IL\",\
        \"hi-IN\",\
        \"id-ID\",\
        \"it-IT\",\
        \"ja-JP\",\
        \"ko-KR\",\
        \"ms-MY\",\
        \"nl-NL\",\
        \"pt-BR\",\
        \"pt-PT\",\
        \"ru-RU\",\
        \"ta-IN\",\
        \"te-IN\",\
        \"tr-TR\",\
        \"zh-CN\"\
      ]\
    },\
    \"LanguageModel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the custom language model was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The most recent time the custom language model was modified.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code you used to create your custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model used to create the custom language model.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The creation status of a custom language model. When the status is <code>COMPLETED</code> the model is ready for use.</p>\"\
        },\
        \"UpgradeAvailability\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the base model used for the custom language model is up to date. If this field is <code>true</code> then you are running the most up-to-date version of the base model in your custom language model.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The reason why the custom language model couldn't be created.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The data access role and Amazon S3 prefixes for the input files used to train the custom language model.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure used to describe a custom language model.</p>\"\
    },\
    \"LanguageOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageCode\"},\
      \"min\":2\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Either you have sent too many requests or your input file is too long. Wait before you resend your request, or use a smaller file and resend the request.</p>\",\
      \"exception\":true\
    },\
    \"ListLanguageModelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusEquals\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>When specified, returns only custom language models with the specified status. Language models are ordered by creation date, with the newest models first. If you don't specify a status, Amazon Transcribe returns all custom language models ordered by date.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>When specified, the custom language model names returned contain the substring you've specified.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>When included, fetches the next set of jobs if the result of the previous request was truncated.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of language models to return in the response. If there are fewer results in the list, the response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListLanguageModelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The operation returns a page of jobs at a time. The maximum size of the list is set by the MaxResults parameter. If there are more language models in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the operation to return the next page of language models.</p>\"\
        },\
        \"Models\":{\
          \"shape\":\"Models\",\
          \"documentation\":\"<p>A list of objects containing information about custom language models.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only medical transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don't specify a status, Amazon Transcribe Medical returns all transcription jobs ordered by creation date.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you a receive a truncated result in the previous request of <code>ListMedicalTranscriptionJobs</code>, include <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of medical transcription jobs to return in the response. IF there are fewer results in the list, this response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the medical transcription jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListMedicalTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If the number of jobs exceeds what can fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListMedicalTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"MedicalTranscriptionJobSummaries\":{\
          \"shape\":\"MedicalTranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of your previous request to <code>ListMedicalVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of vocabularies.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in the response.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, returns only vocabularies with the <code>VocabularyState</code> equal to the specified vocabulary state. Use this field to see which vocabularies are ready for your medical transcription jobs.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>Returns vocabularies whose names contain the specified string. The search is not case sensitive. <code>ListMedicalVocabularies</code> returns both \\\"<code>vocabularyname</code>\\\" and \\\"<code>VocabularyName</code>\\\".</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListMedicalVocabularies</code> operation returns a page of vocabularies at a time. You set the maximum number of vocabularies to return on a page with the <code>MaxResults</code> parameter. If there are more jobs in the list will fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. To return the next page of vocabularies, include the token in the next request to the <code>ListMedicalVocabularies</code> operation .</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match your search criteria.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you donât specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date. </p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListTranscriptionJobs</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is not case sensitive, <code>ListVocabularies</code> returns both \\\"vocabularyname\\\" and \\\"VocabularyName\\\" in the response list.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set in the <code>MaxResults</code> parameter. If there are more jobs in the list than will fit on the page, Amazon Transcribe returns the <code>NextPage</code> token. To return in the next page of jobs, include the token in the next request to the <code>ListVocabularies</code> operation.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularyFilters</code> was truncated, include the <code>NextToken</code> to fetch the next set of collections.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of filters to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>Filters the response so that it only contains vocabulary filters whose name contains the specified string.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularyFilters</code> operation returns a page of collections at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularyFilters</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"VocabularyFilters\":{\
          \"shape\":\"VocabularyFilters\",\
          \"documentation\":\"<p>The list of vocabulary filters. It contains at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>\"\
        }\
      }\
    },\
    \"MaxAlternatives\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p>For example:</p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input media file in a transcription request.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\",\
        \"ogg\",\
        \"amr\",\
        \"webm\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"MedicalContentIdentificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PHI\"]\
    },\
    \"MedicalTranscript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the medical transcript.</p> <p>Use this URI to access the medical transcript. This URI points to the S3 bucket you created to store the medical transcript.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a medical transcript.</p>\"\
    },\
    \"MedicalTranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name for a given medical transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The completion status of a medical transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language spoken in the source audio file. US English (en-US) is the only supported language for medical transcriptions. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the source audio containing medical information.</p> <p>If you don't specify the sample rate, Amazon Transcribe Medical determines it for you. If you choose to specify the sample rate, it must match the rate detected by Amazon Transcribe Medical. In most cases, you should leave the <code>MediaSampleHertz</code> blank and let Amazon Transcribe Medical determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"Transcript\":{\
          \"shape\":\"MedicalTranscript\",\
          \"documentation\":\"<p>An object that contains the <code>MedicalTranscript</code>. The <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field contains one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>- The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>- The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>- The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>- The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>- The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i> </p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>- Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html\\\">Amazon Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services General Reference</i> </p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Object that contains object.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Shows the type of content that you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the job to identify personal health information (PHI) in the transcription output.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of any clinicians providing a dictation or having a conversation. <code>PRIMARYCARE</code> is the only available setting for this object. This specialty enables you to generate transcriptions for the following medical fields:</p> <ul> <li> <p>Family Medicine</p> </li> </ul>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The type of speech in the transcription job. <code>CONVERSATION</code> is generally used for patient-physician dialogues. <code>DICTATION</code> is the setting for physicians speaking their notes after seeing a patient. For more information, see <a>how-it-works-med</a> </p>\"\
        }\
      },\
      \"documentation\":\"<p>The data structure that contains the information for a medical transcription job.</p>\"\
    },\
    \"MedicalTranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MedicalTranscriptionJobSummary\"}\
    },\
    \"MedicalTranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of a medical transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the medical transcription job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job began processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the transcript in the source audio file.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the medical transcription job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the transcription job's output.</p> <p>The <code>CUSTOMER_BUCKET</code> is the S3 location provided in the <code>OutputBucketName</code> field when the </p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of the transcription job. <code>Primary care</code> is the only valid value.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Shows the type of information you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the transcription job to identify personal health information (PHI).</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The speech of the clinician in the input audio.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a transcription job.</p>\"\
    },\
    \"MedicalTranscriptionSetting\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels in the <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p> <p>Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code> </p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether alternative transcripts are generated along with the transcript that has the highest confidence. If you set <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>The maximum number of alternatives that you tell the service to return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to use when processing a medical transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Optional settings for the <a>StartMedicalTranscriptionJob</a> operation.</p>\"\
    },\
    \"ModelName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"ModelSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of your custom language model.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object used to call your custom language model to your transcription job.</p>\"\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"Models\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageModel\"}\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".+\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested resource. Check the name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"OutputBucketName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9]\"\
    },\
    \"OutputKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9-_.!*'()/]{1,1024}$\"\
    },\
    \"OutputLocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER_BUCKET\",\
        \"SERVICE_BUCKET\"\
      ]\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\".+\"\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"RedactionOutput\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"redacted\",\
        \"redacted_and_unredacted\"\
      ]\
    },\
    \"RedactionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PII\"]\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription. </p> <p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription contains alternative transcriptions. If you set the <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>The number of alternative transcriptions that the service should return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to use when transcribing the audio. The filter that you specify must have the same language code as the transcription job.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Set to <code>mask</code> to remove filtered text from the transcript and replace it with three asterisks (\\\"***\\\") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text. Set to <code>tag</code> to mark the word in the transcription output that matches the vocabulary filter. When you set the filter method to <code>tag</code>, the words matching your vocabulary filter are not masked or removed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"Specialty\":{\
      \"type\":\"string\",\
      \"enum\":[\"PRIMARYCARE\"]\
    },\
    \"StartMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MedicalTranscriptionJobName\",\
        \"LanguageCode\",\
        \"Media\",\
        \"OutputBucketName\",\
        \"Specialty\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job. You can't use the strings \\\"<code>.</code>\\\" or \\\"<code>..</code>\\\" by themselves as the job name. The name must also be unique within an AWS account. If you try to create a medical transcription job with the same name as a previous medical transcription job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language spoken in the input media file. US English (en-US) is the valid value for medical transcription jobs. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file.</p> <p>If you do not specify the media sample rate, Amazon Transcribe Medical determines the sample rate. If you specify the sample rate, it must match the rate detected by Amazon Transcribe Medical. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe Medical determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The audio format of the input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The Amazon S3 location where the transcription is stored.</p> <p>You must set <code>OutputBucketName</code> for Amazon Transcribe Medical to store the transcription results. Your transcript appears in the S3 location you specify. When you call the <a>GetMedicalTranscriptionJob</a>, the operation returns this location in the <code>TranscriptFileUri</code> field. The S3 bucket must have permissions that allow Amazon Transcribe Medical to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>You can specify a location in an Amazon S3 bucket to store the output of your medical transcription job.</p> <p>If you don't specify an output key, Amazon Transcribe Medical stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is \\\"your-transcription-job-name.json\\\".</p> <p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, \\\"folder1/folder2/\\\", as an output key would lead to the output being stored as \\\"folder1/folder2/your-transcription-job-name.json\\\". If you specify \\\"my-other-job-name.json\\\" as the output key, the object key is changed to \\\"my-other-job-name.json\\\". You can use an output key to change both the prefix and the file name, for example \\\"folder/my-other-job-name.json\\\".</p> <p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <a>StartMedicalTranscriptionJob</a> operation must have permission to use the specified KMS key.</p> <p>You use either of the following to identify a KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p>You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: \\\"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:account ID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the medical transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Optional settings for the medical transcription job.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>You can configure Amazon Transcribe Medical to label content in the transcription output. If you specify <code>PHI</code>, Amazon Transcribe Medical labels the personal health information (PHI) that it identifies in the transcription output.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of any clinician speaking in the input media.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The type of speech in the input audio. <code>CONVERSATION</code> refers to conversations between two or more speakers, e.g., a conversations between doctors and patients. <code>DICTATION</code> refers to single-speaker dictated speech, e.g., for clinical notes.</p>\"\
        }\
      }\
    },\
    \"StartMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>A batch job submitted to transcribe medical speech to text.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job. You can't use the strings \\\"<code>.</code>\\\" or \\\"<code>..</code>\\\" by themselves as the job name. The name must also be unique within an AWS account. If you try to create a transcription job with the same name as a previous transcription job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used in the input media file.</p> <p>To transcribe speech in Modern Standard Arabic (ar-SA), your audio or video file must be encoded at a sample rate of 16000 Hz or higher.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p> <p>If you do not specify the media sample rate, Amazon Transcribe determines the sample rate. If you specify the sample rate, it must match the sample rate detected by Amazon Transcribe. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The location where the transcription is stored.</p> <p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p> <p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>You can specify a location in an Amazon S3 bucket to store the output of your transcription job.</p> <p>If you don't specify an output key, Amazon Transcribe stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is \\\"your-transcription-job-name.json\\\".</p> <p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, \\\"folder1/folder2/\\\", as an output key would lead to the output being stored as \\\"folder1/folder2/your-transcription-job-name.json\\\". If you specify \\\"my-other-job-name.json\\\" as the output key, the object key is changed to \\\"my-other-job-name.json\\\". You can use an output key to change both the prefix and the file name, for example \\\"folder/my-other-job-name.json\\\".</p> <p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p> <p>You can use either of the following to identify a KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p>You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS Key: \\\"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:account ID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3). </p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>Choose the custom language model you use for your transcription job in this parameter.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that contains the request parameters for content redaction.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set this field to <code>true</code> to enable automatic language identification. Automatic language identification is disabled by default. You receive a <code>BadRequestException</code> error if you enter a value for a <code>LanguageCode</code>.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>An object containing a list of languages that might be present in your collection of audio files. Automatic language identification chooses a language that best matches the source audio from that list.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object containing details of the asynchronous transcription job.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the transcript.</p> <p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        },\
        \"RedactedTranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the redacted transcript.</p> <p>Use this URI to access the redacted transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a transcription.</p>\"\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for the transcription job.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>An object that describes the output of the transcription job.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows with the job was started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field can contain one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe\\\">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>An object containing the details of your custom language model.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that describes content redaction settings for the transcription job.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A value that shows if automatic language identification was enabled for a transcription job.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>An object that shows the optional array of languages inputted for transcription jobs with automatic language identification enabled.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>A value between zero and one that Amazon Transcribe assigned to the language that it identified in the source audio. Larger values indicate that Amazon Transcribe has higher confidence in the language it identified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the output of the transcription job.</p> <p>If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3 bucket specified in the <code>outputBucketName</code> field when the transcription job was started with the <code>StartTranscriptionJob</code> operation.</p> <p>If the value is <code>SERVICE_BUCKET</code> then the output is stored by Amazon Transcribe and can be retrieved using the URI in the <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code> field.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>The content redaction settings of the transcription job.</p>\"\
        },\
        \"ModelSettings\":{\"shape\":\"ModelSettings\"},\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether automatic language identification was enabled for a transcription job.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>A value between zero and one that Amazon Transcribe assigned to the language it identified in the source audio. A higher score indicates that Amazon Transcribe is more confident in the language it identified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of information about a transcription job.</p>\"\
    },\
    \"Type\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONVERSATION\",\
        \"DICTATION\"\
      ]\
    },\
    \"UpdateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a vocabulary you've already made, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the language used for the entries in the updated vocabulary. US English (en-US) is the only valid language code in Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The location in Amazon S3 of the text file that contains the you use for your custom vocabulary. The URI must be in the same AWS Region as the resource that you are calling. The following is the format for a URI:</p> <p> <code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code> </p> <p>For more information about Amazon S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies in Amazon Transcribe Medical, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Medical Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the updated vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language of the text file used to update the custom vocabulary. US English (en-US) is the only language supported in Amazon Transcribe Medical.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the update to the vocabulary. When the <code>VocabularyState</code> field is <code>READY</code>, the vocabulary is ready to be used in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to update. If you try to update a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>The specified file must be less than 50 KB of UTF-8 characters.</p> <p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the updated vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary filter was updated.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a previous vocabulary you will receive a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a>what-is-transcribe</a>.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings containing the vocabulary entries.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p>For example:</p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that was updated.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\"(s3://|http(s*)://).+\"\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyFilterInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter. The name must be unique in the account that holds the filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a vocabulary filter.</p>\"\
    },\
    \"VocabularyFilterMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remove\",\
        \"mask\",\
        \"tag\"\
      ]\
    },\
    \"VocabularyFilterName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyFilterInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary. </p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    },\
    \"Word\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Words\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Word\"},\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Operations and objects for transcribing speech to text.</p>\"\
}\
";
}

@end
